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

## Data to be displayed

The following information should be easy and efficient to obtain from the
database:

- Attendance information (how many people are going and are still required) for
  a given time period (one day or shift in particular, a week, or a month),
- Historical attendance statistics for a given volunteer (how often has a
  person come, with statistics on their preferred shifts/days),
- Future attendance information for a given volunteer (calendar view of next
  shifts, reminders),
- Historical statistics for the shelter's shifts (when are people most
  available, what events are most popular, etc).

## Data to be stored

This part of the document attempts to list every single piece of data that
should be stored for a given shift. There will be a normalisation process
during which we try to optimise how all that data is stored.

Shift:

- Start date & time,
- End date & time,
- Description,
- Shift type,
- Number of volunteers required,
- Number of staff required,
- List of volunteers who are available,
- List of volunteers who are going (have been approved by staff),
- List of staff who are going.

## Initial table design

### ShiftTypes

| Column name         | Column type | Column attributes |
|---------------------|-------------|-------------------|
| id                  | Integer     | primary key       |
| begins_at           | Time        | not nullable      |
| ends_at             | Time        | not nullable      |
| description         | Text        | not nullable      |
| staff_required      | Integer     | not nullable      |
| volunteers_required | Integer     | not nullable      |

### Shifts

| Column name         | Column type | Column attributes   |
|---------------------|-------------|---------------------|
| id                  | Integer     | primary key         |
| begins_on           | Date        | not nullable, index |
| ends_on             | Date        | nullable            |
| starts_at           | Time        | nullable            |
| ends_at             | Time        | nullable            |
| shift_type_id       | Integer     | foreign key         |
| description         | Text        | nullable            |
| staff_required      | Integer     | nullable            |
| volunteers_required | Integer     | nullable            |

### ShiftRegistrations

| Column name  | Column type | Column attributes                    |
|--------------|-------------|--------------------------------------|
| id           | Integer     | primary key                          |
| volunteer_id | Integer     | not nullable, foreign key            |
| shift_id     | Integer     | not nullable, foreign key            |
| requested_at | DateTime    | not nullable, index, default: now()  |
| is_approved  | Bool        | not nullable, default: false         |
| approved_at  | DateTime    | nullable, default: null              |
| admin_id     | Integer     | foreign key, nullable, default: null |
| is_cancelled | Bool        | not nullable, default: false         |
| cancelled_at | DateTime    | nullable, default: null              |
| reason       | Text        | nullable, default: null              |
