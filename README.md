# Installing

    bundle install

## Setup

To be filled out :).

# Running

    shotgun -o 0.0.0.0

# Contents of `.env`

The `.env` file allows you to define environment variables that will be loaded
into the Ruby app, without the need to expose them system-wide. I don't know if
there's actually any security benefit in that, but it just makes managing
different servers and environments easier.

You should define the two following values: `GOOGLE_CLIENT_SECRET` and
`DATABASE_URL`. The first one is required to interract with Google's APIs, and
the second one is where to connect to in order to store things in a more
permanent way. Example:

    GOOGLE_CLIENT_SECRET='foobarzob'
    DATABASE_URL='sqlite://foo.db'
