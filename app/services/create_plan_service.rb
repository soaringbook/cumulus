class CreatePlanService
  def call
    Plan.where(name: 'Cumulus').first_or_initialize do |p|
      p.amount = 3000
      p.interval = 'month'
      p.stripe_id = 'cumulus'
    end.save!(validate: false)

    Plan.where(name: 'Cumulus no trial').first_or_initialize do |p|
      p.amount = 3000
      p.interval = 'month'
      p.stripe_id = 'cumulus_no_trial'
    end.save!(validate: false)
  end
end
