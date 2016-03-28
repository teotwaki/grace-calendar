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

    foo_user = User.new
    foo_user.first_name = 'John'
    foo_user.last_name = 'Doe'
    foo_user.email = 'an@example.com'
    foo_user.admin = true
    foo_user.save

    for i in 0..30 do
      foo_post = Post.new
      foo_post.title = 'Welcome to GraceKBH Volunteers!'
      foo_post.content = "We hope you like it.\n\nYes, we really do."
      foo_post.posted = Time.now
      foo_post.user = foo_user
      foo_post.save
    end
  end

end
