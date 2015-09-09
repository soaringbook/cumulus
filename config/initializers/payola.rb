Payola.configure do |config|
  config.secret_key = ENV['STRIPE_API_KEY']
  config.publishable_key = ENV['STRIPE_PUBLISHABLE_KEY']
end
