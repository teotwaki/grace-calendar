Bundler.require
Dotenv.load

# Load all the helpers
require_all 'helpers'

# Load all the models
require_all 'db/models'

# Initialise GlobalPhone DB
GlobalPhone.db_path = File.expand_path('../global_phone.json', __FILE__)

# Tell Sinatra where to find our API code
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'grace_api'

run GraceApi::App
