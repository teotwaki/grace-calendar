require 'models_helper'
include Grace::Models

RSpec.describe Post do
  it 'has a valid factory' do
    expect(create(:post)).to be_valid
  end

  it 'is invalid without a title' do
    expect(build(:post, title: nil)).to_not be_valid
  end

  it 'is invalid without content' do
    expect(build(:post, content: nil)).to_not be_valid
  end

  it 'is invalid without an author' do
    expect(build(:post, user: nil)).to_not be_valid
  end

  it 'supports serialising to json' do
    expect(Post.method_defined? 'to_json').to be true
  end

  it 'gives access to its author' do
    expect(create(:post).user).to_not be_nil
  end
end
