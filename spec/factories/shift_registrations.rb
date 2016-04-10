FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :shift_registration do |f|
    f.volunteer { create(:user) }
    f.shift { create(:shift) }
  end
end
