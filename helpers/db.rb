unless defined? DB
  DB = Sequel.connect ENV.fetch('DATABASE_URL')
  DB.extension :pagination
  require 'will_paginate/sequel'
end
