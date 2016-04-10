require 'models_helper'
include Grace::Models

RSpec.describe OauthUser do
  it 'has a valid factory' do
    expect(create(:oauth_user)).to be_valid
  end

  it 'is invalid without a provider' do
    expect(build(:oauth_user, provider: nil)).to_not be_valid
  end

  it 'is invalid without an id' do
    expect(build(:oauth_user, id: nil)).to_not be_valid
  end

  it 'is invalid without a user' do
    expect(build(:oauth_user, user: nil)).to_not be_valid
  end

  it 'gives access to its associated user' do
    expect(create(:oauth_user).user).to_not be_nil
  end
end
