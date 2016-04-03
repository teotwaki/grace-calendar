# Grace

A volunteer management system.

# Origin

This project was created by Sebastian Lauwers and Heba Bieri in order to help
out the GraceKBH shelter for homeless people. The GraceKBH shelter provides
breakfast, dinner and beds for homeless people in Copenhagen, during the
cold(er) winter nights. During the summer, the shelter only provides breakfast.
During shifts, the shelter is mostly manned by volunteers.

A certain number of volunteers are required in order for the shift to be
allowed. If there are not enough people present, the shift is cancelled and
everyone is sent packing.

For the breakfast shift, two people are required to be on-site for the shelter
to operate. For the dinner shift, at least four people are required. At night,
two people are required as well.

## Historical workflow description

Anyone is allowed to sign up as a volunteer. This is done by sending an email
to the staff. The staff registers the volunteer and he/she is sent a "care
package" by email, consisting mainly of information regarding the shelter.

From that point onwards, volunteers have access to a shared Google spreadsheet
(in read only mode) that lists the shifts for the coming weeks. Each shift
lists the number of volunteers that have signed up. When a volunteer wants to
sign up for a shift, they have to send an email requesting to be added to a
specific shift. Until they have received a confirmation email, the volunteer
doesn't know whether they are supposed to go or not.

Every once in a while, there are not enough people available to man a given
shift. If there are too many people missing, the shift is cancelled. When this
happens, the staff sends an email to all registered volunteers to try and find
enough people to fill in the gaps. Sometimes, the staff will also reach out
directly by phone to certain (known) volunteers in order to ask for help.

## Project goals

The aim of this project is to lessen the burden of handling all the volunteers,
and make it easier for volunteers to sign up. By automating a number of tasks,
or simplifying them, it is our hope that we will enable more volunteers to
join, and free up more time for the staff to handle more urgent tasks.

If possible, a secondary goal is to make the project usable by other
shelters/organisations with similar requirements.

# Design considerations

Above all, the resulting application has to be easy to use. The people who will
(hopefully) end up using it aren't supposed to have any technical knowledge,
and the project should try, as much as possible, to work *with them*, or *for
them*, instead of against them.

The application should also be focused on mobile usage, almost exclusively.
Nearly every single interaction will be done on mobile devices, and as such,
this is the primary target. Denmark is a country where iDevices run rampant (as
opposed to Android), however it is *not* a stated project goal to be overly
Apple-compatible, to the detriment of Android users. It should be noted that
the developers currently only have access to Android devices.

As such, the project is currently orienting itself towards being a
mobile-friendly website.

## Design principles:

- Easy to understand and use,
- Nice to use,
- Robust,
- Useful,
- Easy to run and maintain,
- Not too ugly to look at.
