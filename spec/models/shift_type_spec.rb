require 'models_helper'

require_rel '../../app/models/shift_type'
include Grace::Models

RSpec.describe ShiftType do
  it 'has a valid factory' do
    expect(create(:shift_type)).to be_valid
  end

  it 'is invalid without a start time' do
    expect(build(:shift_type, begins_at: nil)).to_not be_valid
  end

  it 'is invalid without an end time' do
    expect(build(:shift_type, ends_at: nil)).to_not be_valid
  end

  it 'is invalid without a description' do
    expect(build(:shift_type, description: nil)).to_not be_valid
  end

  it 'is invalid without the number of required staff' do
    expect(build(:shift_type, staff_required: nil)).to_not be_valid
  end

  it 'is invalid without the number of required volunteers' do
    expect(build(:shift_type, volunteers_required: nil)).to_not be_valid
  end

  it 'provides access to the shifts that use it as a template' do
    expect(create(:shift_type).shifts).to have(0).items
  end
end
