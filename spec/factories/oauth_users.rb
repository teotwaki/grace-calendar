FactoryGirl.define do
  factory :oauth_user do
    user

    provider { Faker::Company.name }
    id { Faker::Code.ean }
  end
end
