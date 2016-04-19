FactoryGirl.define do
  factory :user, class: Grace::Models::User, aliases: [:volunteer] do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email_address { Faker::Internet.email }

    factory :admin do
      is_admin true
    end
  end
end
