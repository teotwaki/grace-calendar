Bundler.require
Dotenv.load

# Load the application dependencies
require_all 'app'

# Load the main application
require './app'
run Grace::App
