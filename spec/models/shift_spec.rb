require 'models_helper'
require 'as-duration'

require_rel '../../app/models/shift'
include Grace::Models

RSpec.describe Shift do
  it 'has a valid factory' do
    expect(create(:shift)).to be_valid
  end

  it 'is invalid without a start date' do
    expect(build(:shift, begins_on: nil)).to_not be_valid
  end

  it 'is invalid without a shift type' do
    expect(build(:shift, shift_type: nil)).to_not be_valid
  end

  it 'provides access to the shift type that it uses as a template' do
    expect(create(:shift).shift_type).to_not be_nil
  end
end
