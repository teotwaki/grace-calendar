Bundler.require
Dotenv.load

# Tell Sinatra where to find our API code
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'grace_api'

run GraceApi::App
