Bundler.require
Dotenv.load

# Load the DB helper
require 'helpers/db'

# Initialise GlobalPhone DB
GlobalPhone.db_path = File.expand_path('../global_phone.json', __FILE__)

# Tell Sinatra where to find our API code
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'grace_api'

run GraceApi::App
