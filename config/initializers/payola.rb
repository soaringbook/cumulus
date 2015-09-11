Payola.configure do |config|
  config.secret_key = ENV['STRIPE_API_KEY']
  config.publishable_key = ENV['STRIPE_PUBLISHABLE_KEY']

  config.subscribe 'customer.subscription.updated' do |event|
    object = event.data.object
    subscription = Payola::Subscription.find_by!(stripe_id: object.id)
    if plan = Plan.where(stripe_id: object.plan.id).try(:first)
      subscription.plan_id = plan.id
    end
    subscription.sync_with!(object)
  end

  config.subscribe('payola.subscription.active') do |subscription|
    pilot = Pilot.find_by(email: subscription.email)
    if club =  pilot.try(:club)
      club.subscription = subscription
      club.plan_id = subscription.plan_id
      club.save

      subscription.owner = club
      subscription.save!
    end
  end
end
