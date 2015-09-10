Payola.configure do |config|
  config.secret_key = ENV['STRIPE_API_KEY']
  config.publishable_key = ENV['STRIPE_PUBLISHABLE_KEY']

  config.subscribe('payola.subscription.active') do |subscription|
    pilot = Pilot.find_by(email: subscription.email)

    if club =  pilot.try(:club)
      club.trial_subscription!

      subscription.owner = club
      subscription.save!
    end
  end
end

