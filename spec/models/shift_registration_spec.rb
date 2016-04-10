require 'models_helper'

require_rel '../../app/models/shift_registration'
include Grace::Models

RSpec.describe ShiftRegistration do
  it 'has a valid factory' do
    expect(create(:shift_registration)).to be_valid
  end

  it 'is invalid without a volunteer' do
    expect(build(:shift_registration, volunteer: nil)).to_not be_valid
  end

  it 'is invalid without a shift' do
    expect(build(:shift_registration, shift: nil)).to_not be_valid
  end

  it 'provides access to the shift it applies to' do
    expect(create(:shift_registration).shift).to_not be_nil
  end

  it 'provides access to the user who requested it' do
    expect(create(:shift_registration).volunteer).to_not be_nil
  end

  it 'provides access to the admin who authorised it' do
    expect(create(:approved_shift_registration).admin).to_not be_nil
  end
end
