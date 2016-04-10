require 'faker'

FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :oauth_user do |f|
    f.provider { Faker::Company.name }
    f.id { Faker::Code.ean }
    f.user { create(:user) }
  end
end
