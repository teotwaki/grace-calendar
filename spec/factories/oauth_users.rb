FactoryGirl.define do
  factory :oauth_user, class: Grace::Models::OauthUser do
    user

    provider { Faker::Company.name }
    id { Faker::Code.ean }
  end
end
