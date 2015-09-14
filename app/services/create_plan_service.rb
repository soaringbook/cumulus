class CreatePlanService
  def call
    pack = Plan.where(name: 'Cumulus').first_or_initialize do |p|
      p.amount = 3000
      p.interval = 'month'
      p.stripe_id = 'cumulus'
    end
    pack.save!(validate: false)
  end
end
