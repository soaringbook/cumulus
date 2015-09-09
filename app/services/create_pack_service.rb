class CreatePackService
  def call
    basic_pack = Pack.where(name: 'Basic Pack').first_or_initialize do |p|
      p.amount = 20000
      p.interval = 'year'
      p.stripe_id = 'basic_pack'
    end
    basic_pack.save!(validate: false)

    extended_pack = Pack.where(name: 'Extended Pack').first_or_initialize do |p|
      p.amount = 30000
      p.interval = 'year'
      p.stripe_id = 'extended_pack'
    end
    extended_pack.save!(validate: false)

    full_pack = Pack.where(name: 'Full Pack').first_or_initialize do |p|
      p.amount = 30000
      p.interval = 'year'
      p.stripe_id = 'full_pack'
    end
    full_pack.save!(validate: false)
  end
end
