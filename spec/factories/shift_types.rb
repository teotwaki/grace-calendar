FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :shift_type do |f|
    f.begins_at { Faker::Time.between(1.days.ago, Date.today, :morning) }
    f.ends_at { Faker::Time.between(1.days.ago, Date.today, :afternoon) }
    f.description { Faker::Lorem.sentence }
    f.staff_required { Faker::Number.between(1, 4) }
    f.volunteers_required { Faker::Number.between(3, 6) }
  end
end
