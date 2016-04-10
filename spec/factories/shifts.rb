FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :shift do |f|
    f.begins_on { Faker::Date.between(2.days.ago, 2.days.from_now) }
    f.shift_type { create(:shift_type) }
  end
end
