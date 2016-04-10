FactoryGirl.define do
  factory :shift_registration do
    volunteer
    shift

    factory :approved_shift_registration do
      admin

      is_approved true
    end
  end
end
