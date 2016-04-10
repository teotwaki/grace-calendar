require 'faker'

FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :post do |f|
    f.title { Faker::Lorem.sentence }
    f.content { Faker::Lorem.paragraph(3, true) }
    f.user { create(:user) }
  end
end
