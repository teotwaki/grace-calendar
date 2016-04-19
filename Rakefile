begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
  Rake::Task[:spec].enhance ['internal:test_environment', 'db:migrate']
rescue LoadError
end

namespace :internal do
  desc 'Force test environment'
  task :test_environment do |t|
    ENV['GRACE_ENVIRONMENT'] = 'test'
  end

  desc 'Set or load the application environment'
  task :environment do |t|
    ENV['GRACE_ENVIRONMENT'] ||= 'development'

    if ENV['GRACE_ENVIRONMENT'] == 'test'
      ENV['DATABASE_URL'] = 'sqlite://db/test.db'
      ENV['JWT_HMAC_SECRET'] = 'foobar'
      ENV['GOOGLE_CLIENT_SECRET'] = 'foobar'
    else
      require 'dotenv'
      Dotenv.load
    end
  end
end

namespace :db do
  desc 'Setup Sequel database'
  task :sequel => ['internal:environment'] do |t|
    require 'sequel'
    DB = Sequel.connect(ENV.fetch('DATABASE_URL'))
  end

  desc 'Run migrations'
  task :migrate, [:version] => [:sequel] do |t, args|
    Sequel.extension :migration
    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(DB, 'db/migrations', target: args[:version].to_i)
    else
      puts 'Migrating to latest'
      Sequel::Migrator.run(DB, 'db/migrations')
    end
  end

  desc 'Seed the database'
  task :seed => ['db:migrate'] do |t|
    require 'faker'
    require 'factory_girl'
    require 'require_all'
    require_all 'app/models'

    FactoryGirl.find_definitions
    FactoryGirl.define do
      to_create { |instance| instance.save }
    end

    (0..3).each do
      u = FactoryGirl.build(:user, is_admin: true)
      u.save

      (0..10).each do
        FactoryGirl.build(:post, user: u).save
      end
    end

    (0..200).each do
      FactoryGirl.build(:user, is_approved: true).save
    end

    (0..10).each do
      FactoryGirl.create(:user)
    end
  end
end
