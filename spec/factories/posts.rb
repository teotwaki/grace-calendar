FactoryGirl.define do
  factory :post, class: Grace::Models::Post do
    user

    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph(3, true) }
  end
end
