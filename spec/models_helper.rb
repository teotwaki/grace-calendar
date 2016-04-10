require 'factory_girl'
require 'faker'
require 'require_all'
require 'rspec/collection_matchers'

require_all 'app/helpers'
require_all 'app/models'

RSpec.configure do |config|
  config.around(:each) do |example|
    DB.transaction(rollback: :always, auto_savepoint: true) { example.run }
  end

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end
end
