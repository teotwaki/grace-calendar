# Load the app environment
require 'dotenv'
Dotenv.load

namespace :db do
  desc 'Setup Sequel database'
  task :sequel do |t|
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
  task :seed => [:sequel] do |t|
    require 'require_all'
    require_all 'db/models'

    admin = User.new
    admin.first_name = 'Sebastian'
    admin.last_name = 'Lauwers'
    admin.email = 'sebastian.lauwers@gmail.com'
    admin.admin = true
    admin.save

    u = User.new
    u.first_name = 'Sebastian'
    u.last_name = 'Lauwers'
    u.email = 'crashanddie@gmail.com'
    u.save

    u = User.new
    u.first_name = 'Bertram'
    u.last_name = 'Iversen'
    u.email = "#{u.first_name}#{u.last_name}@example.com".downcase
    u.save

    u = User.new
    u.first_name = 'Mille'
    u.last_name = 'Overgaard'
    u.email = "#{u.first_name}#{u.last_name}@example.com".downcase
    u.save

    u = User.new
    u.first_name = 'Astrid'
    u.last_name = 'Jakobsen'
    u.email = "#{u.first_name}#{u.last_name}@example.com".downcase
    u.save

    u = User.new
    u.first_name = 'Victor'
    u.last_name = 'Bertelsen'
    u.email = "#{u.first_name}#{u.last_name}@example.com".downcase
    u.save

    u = User.new
    u.first_name = 'Anna'
    u.last_name = 'Olesen'
    u.email = "#{u.first_name}#{u.last_name}@example.com".downcase
    u.save

    u = User.new
    u.first_name = 'Søren'
    u.last_name = 'Steffensen'
    u.email = "#{u.first_name}#{u.last_name}@example.com".downcase
    u.save

    u = User.new
    u.first_name = 'Mimir'
    u.last_name = 'Andreasen'
    u.email = "#{u.first_name}#{u.last_name}@example.com".downcase
    u.save

    u = User.new
    u.first_name = 'Nicklas'
    u.last_name = 'Kruse'
    u.email = "#{u.first_name}#{u.last_name}@example.com".downcase
    u.save

    u = User.new
    u.first_name = 'Natasja'
    u.last_name = 'Holst'
    u.email = "#{u.first_name}#{u.last_name}@example.com".downcase
    u.save

    u = User.new
    u.first_name = 'Mette'
    u.last_name = 'Lauritsen'
    u.email = "#{u.first_name}#{u.last_name}@example.com".downcase
    u.save

    for i in 0..30 do
      p = Post.new
      p.title = 'Welcome to GraceKBH Volunteers!'
      p.content = "We hope you like it.\n\nYes, we really do."
      p.posted = Time.now
      p.user = admin
      p.save
    end
  end

end
