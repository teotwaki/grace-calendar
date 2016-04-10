FactoryGirl.define do
  factory :shift_type do
    begins_at { Faker::Time.between(1.days.ago, Date.today, :morning) }
    ends_at { Faker::Time.between(1.days.ago, Date.today, :afternoon) }
    description { Faker::Lorem.sentence }
    staff_required { Faker::Number.between(1, 4) }
    volunteers_required { Faker::Number.between(3, 6) }
  end
end
