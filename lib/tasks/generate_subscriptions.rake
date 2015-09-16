namespace :generate do
  desc 'Generate subscription plans'
  task :subscriptions => :environment do
    puts '--> Looking for a cumulus subscription plan.'
    plan = Plan.where(stripe_id: 'cumulus').first
    next unless plan.nil?

    puts '--> No cumulus subscription plan found.'
    plan = Plan.create({
      stripe_id: 'cumulus',
      amount: 3000,
      interval: 'month',
      name: 'Cumulus',
      currency: 'EUR',
      trial_period_days: 15
    })

    raise plan.errors.inspect if plan.errors.count > 0
    puts '--> Created a cumulus subscription plan.'
  end
end
