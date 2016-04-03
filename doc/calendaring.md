# Calendaring documentation

This is a design document that attempts to encapsulate the different
complexities about the system. This document will most probably evolve as new
functional requirements are discovered.

## Number of items/rows

This author believes that the best way to keep a database running fast is to
not use it. Even though this project only targets a user base of maybe 100
people maximum per year, I'd still like to limit the number of things to store
in the database, if possible.

Let's look at some numbers:

365 days per year  
3-5 shifts per day  
4-10 volunteers per shift  
Rough total: ~20000 events to be stored.

Please note that in the numbers above, I'm not looking at GraceKBH's
requirements exclusively. I'm extending the requirements a bit to give
ourselves a bit of headroom.
