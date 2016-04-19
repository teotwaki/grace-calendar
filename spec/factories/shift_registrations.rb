FactoryGirl.define do
  factory :shift_registration, class: Grace::Models::ShiftRegistration do
    volunteer
    shift

    factory :approved_shift_registration do
      admin

      is_approved true
    end
  end
end
