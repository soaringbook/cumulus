FactoryGirl.define do
  factory :club do
    short_name { Faker::Lorem.characters(5) }
    active_until { Faker::Date.forward(100) }
  end
end
