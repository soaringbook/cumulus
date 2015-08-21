FactoryGirl.define do
  factory :pilot do
    email { Faker::Internet.email }

    some_password = Faker::Internet.password
    password              some_password
    password_confirmation some_password
  end
end


