Payola.configure do |config|
  config.secret_key = ENV['STRIPE_API_KEY']
  config.publishable_key = ENV['STRIPE_PUBLISHABLE_KEY']

  config.subscribe('payola.subscription.active') do |subscription|
    pilot = Pilot.find_by(email: subscription.email)

    if club =  pilot.try(:club)
      club.subscription_type = :trial_subscription
      club.pack_id = subscription.plan_id
      club.save

      subscription.owner = club
      subscription.save!
    end
  end
end

