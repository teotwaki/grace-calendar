Bundler.require
Dotenv.load

# Load the application dependencies
require_all 'app'

# Initialise GlobalPhone DB
GlobalPhone.db_path = File.expand_path('../global_phone.json', __FILE__)

# Load the main application
require './app'
run Grace::App
