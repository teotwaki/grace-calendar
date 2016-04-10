require 'models_helper'
include Grace::Models

RSpec.describe User do
  it 'has a valid factory' do
    expect(create(:user)).to be_valid
  end

  it 'is invalid without a first name' do
    expect(build(:user, first_name: nil)).to_not be_valid
  end

  it 'is invalid without a last name' do
    expect(build(:user, last_name: nil)).to_not be_valid
  end

  it 'is invalid without an email address' do
    expect(build(:user, email_address: nil)).to_not be_valid
  end

  it 'is invalid with an invalid email address' do
    expect(build(:user, email_address: 'foo')).to_not be_valid
  end

  it 'is invalid with an invalid phone number' do
    expect(build(:user, phone_number: 'foo')).to_not be_valid
  end

  it 'supports serialising to json' do
    expect(User.method_defined? 'to_json').to be true
  end

  it 'gives access to its published posts' do
    expect(create(:user).posts).to have(0).items
  end

  it 'gives access to its oauth users' do
    expect(create(:user).oauth_users).to have(0).items
  end

  it 'gives access to its registrations' do
    expect(create(:user).shift_registrations).to have(0).items
  end

  it 'gives access to its approvals' do
    expect(create(:user).shift_approvals).to have(0).items
  end
end
