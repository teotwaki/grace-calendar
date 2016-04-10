require 'dotenv'

Dotenv.load

# Load the main application
require './app'
run Grace::App
