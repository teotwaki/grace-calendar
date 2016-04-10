source 'https://rubygems.org'

# Middleware
gem 'sinatra', '~> 1.4.7'
gem 'sinatra-param', '~> 1.4.0', require: 'sinatra/param'
gem 'require_all', '~> 1.3.3'
gem 'will_paginate', '~> 3.1.0'

# Parsing and stuff, listed to here to be automatically require'd
gem 'json', '~> 1.8.3'

# Configuration
gem 'dotenv', '~> 2.1.0'

# Make HTTP requests to verify OAuth tokens
gem 'httparty', '~> 0.13.7'
gem 'jwt', '~> 1.5.4'

# Database stuff
gem 'sequel', '~> 4.32.0', require: false
gem 'rake', '~> 10.4.2', require: false
gem 'global_phone', '~> 1.0.1'

group :development, :test do
  gem 'sqlite3', '~> 1.3.11', require: false
end

group :development do
  # Server that automatically reloads ruby code
  gem 'shotgun', '~> 0.9.1', require: false
end

group :test do
  # Unit test framework
  gem 'rspec', '~> 3.4.0', require: false
  gem 'rspec-collection_matchers', '~> 1.1.2', require: false
  gem 'rspec_junit_formatter', '~> 0.2.3', require: false

  # Object factory for model testing
  gem 'factory_girl', '~> 4.7.0', require: false

  # Fake data generator for model testing
  gem 'faker', '~> 1.6.3', require: false

  # Nicer time manipulation (`5.days.ago`, etc)
  gem 'as-duration', '~> 0.1.0', require: false
end
