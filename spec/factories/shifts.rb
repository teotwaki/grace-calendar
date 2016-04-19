FactoryGirl.define do
  factory :shift, class: Grace::Models::Shift do
    shift_type

    begins_on { Faker::Date.between(2.days.ago, 2.days.from_now) }
  end
end
