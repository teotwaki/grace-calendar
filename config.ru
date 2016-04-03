Bundler.require
Dotenv.load

# Load all the helpers
require_all 'helpers'

# Load all the models
require_all 'db/models'

# Load the libraries
require_all 'lib'

# Initialise GlobalPhone DB
GlobalPhone.db_path = File.expand_path('../global_phone.json', __FILE__)

# Load the main application
require './app'
run GraceApi::App
