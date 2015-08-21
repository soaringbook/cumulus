FactoryGirl.define do
  factory :club do
    short_name { Faker::Lorem.characters(5) }
  end
end
