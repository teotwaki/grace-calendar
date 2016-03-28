unless defined? DB
  DB = Sequel.connect ENV.fetch('DATABASE_URL')
end
