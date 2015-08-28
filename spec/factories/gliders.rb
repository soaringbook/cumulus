FactoryGirl.define do
  factory :glider do
    immatriculation { Faker::Lorem.characters(5) }
    name            { Faker:: Lorem.words(3) }
  end
end
