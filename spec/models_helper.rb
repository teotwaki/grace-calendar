require 'factory_girl'
require 'faker'

RSpec.configure do |config|
  config.around(:each) do |example|
    DB.transaction(rollback: :always, auto_savepoint: true) { example.run }
  end

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end
end

FactoryGirl.define do
  to_create { |instance| instance.save }
end
