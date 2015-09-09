FactoryGirl.define do
  factory :pilot do
    email      { Faker::Internet.email }
    first_name { Faker::Name.name }
    last_name  { Faker::Name.name }

    some_password = Faker::Internet.password
    password some_password
    password_confirmation some_password

    club

    confirmed_at Time.now
  end
end
