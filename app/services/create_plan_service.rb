class CreatePlanService
  def call
    basic_pack = Plan.where(name: 'Basic').first_or_initialize do |p|
      p.amount = 2000
      p.interval = 'month'
      p.stripe_id = 'basic'
    end
    basic_pack.save!(validate: false)

    extended_pack = Plan.where(name: 'Extended').first_or_initialize do |p|
      p.amount = 3000
      p.interval = 'month'
      p.stripe_id = 'extended'
    end
    extended_pack.save!(validate: false)

    full_pack = Plan.where(name: 'Full').first_or_initialize do |p|
      p.amount = 4000
      p.interval = 'month'
      p.stripe_id = 'full'
    end
    full_pack.save!(validate: false)
  end
end
