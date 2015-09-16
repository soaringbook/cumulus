FactoryGirl.define do
  factory :plan do
    amount { Faker::Lorem.characters(5) }
    name   { Faker:: Lorem.words(3) }
    id     { Faker::Lorem.characters(1) }
  end
end
