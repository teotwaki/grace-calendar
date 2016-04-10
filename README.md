# Grace Volunteers

[![Build Status](https://travis-ci.org/teotwaki/grace-calendar.svg?branch=develop)](https://travis-ci.org/teotwaki/grace-calendar)

Want to learn more about this project? See [this page](https://github.com/teotwaki/grace-calendar/blob/develop/doc/general.md).

# Installing

    bundle install

## Setup demo environment

    bundle exec rake db:seed

## Run tests

    bundle exec rake

This will automatically create a new `db/test.db` if necessary. In certain
cases, if the test database file is corrupted, you might have to delete it.

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

Please note the `.env` file is ignored during unit tests.
