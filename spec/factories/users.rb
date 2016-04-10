require 'faker'

FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :user do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.email_address { Faker::Internet.email }
  end
end
