# Installing

    bundle install

## Setup

    bundle exec rake db:migrate
    bundle exec rake db:seed

# Running

    bundle exec shotgun -o 0.0.0.0

# Contents of `.env`

The `.env` file allows you to define environment variables that will be loaded
into the Ruby app, without the need to expose them system-wide. I don't know if
there's actually any security benefit in that, but it just makes managing
different servers and environments easier.

You should define the following values: `GOOGLE_CLIENT_SECRET`, `DATABASE_URL`
and `JWT_HMAC_SECRET`. The first one is required to interract with Google's
APIs, and the second one is where to connect to in order to store things in a
more permanent way. The last one is used to encrypt the JWT tokens that we
store on the client side. Example:

    GOOGLE_CLIENT_SECRET='foobarzob'
    DATABASE_URL='sqlite://foo.db'
    JWT_HMAC_SECRET='random string of characters'
