Implementation:

This challenge is written entirely using HTML and javascript with use of the Google Maps APIs.

The world map is loaded from Google Maps and the 'flag locations' are set on the map with descriptions. Above each of these in the source is a comment specifying if it is the 1st, 2nd, 3rd, etc.. character in the flag.

Location is retrieved from the browser using navigator.geolocation.

If there is no geolocation, the page notifies the user that geolocation is unavailable.

Otherwise, the file system where the webpage is served from is checked to see if there is a text file with the name of the latitude.longitude.txt.

If not, the user receives a message that they are not near any flags and should get closer to one.

Otherwise, the text from the text file is sent back to the webpage. This text is processed in the webpage to format the text and "decode" the character which is in the flag. This gives the user the message "You are <at waypoint near retrieved geolocation>. Have a Flag Piece! <Character in flag>"

To run/test locally, cd into the folder and type "python -m SimpleHTTPServer" (you need python installed on your machine to do this). Final implementation will hopefully have the used files hidden. Then go to localhost:8000/getgeo2 in your browser.

Solution:

Spoofing geolocation is very easy. Googling "How to spoof geolocation" brings up an easy solution using Google Chrome. Source: http://www.labnol.org/internet/geo-location/27878/

From the source:

"While in Google Chrome, press Ctrl+Shift+I on Windows, or Cmd+Opt+I on Mac, to open the Chrome Developer Tools. Now press the Esc (escape) key to open the Console window. Switch to the Emulation tab and choose the Sensors option in the left sidebar. 

Here check the setting that says “Emulate Geolocation coordinates” and specify the exact latitude and longitude coordinates* that you want to share with that website.

[...]

Now refresh the current web page and it will take your fake location."

The user can check the page source while in Chrome Developer Tools and find the exact latitude and longitude of each of the waypoints and enter these into the tool, refreshing the page after each new coordinate. This should allow them to retrieve each of the flags.

Now all the user needs to do is look at the comments in the source to determine what order the pieces of the flag go in. The order should be [bermuda, north korea, mitre, moscow, sydney opera house, notre dame basilica, antarctica, paris vegas hotel.]

This results in a flag MCA-7FC908FA.

The users could also (depending on the security of the host) directly access the text files holding the pre-formatted text. This would get them access to the following messages:

in Antarctica./12
in Moscow./11
near the Notre Dame Basilica./6
near MITRE Bedford./14
in North Korea./12
near the Paris Hotel./5
near the Sydney Opera House./10
in the Bermuda Triangle./3

Users would then need to observe the webpage source to determine the order of the flag pieces. They would also have to find the formatResponse function and the dict variable to 'unencrypt' from the numbers at the end of these messages to their unobfuscated hex values. The relevant translations are as follows:
12->F
11->9
6->8
14->C
5->A
10->0
3->7

Running the challenge with Docker:

This challenge includes a Dockerfile which can be used to run the challenge. In order to do so run `docker build -t virtualgeocachingbinary .` and then `docker run -d -p 8080:80 virtualgeocachingbinary`. The challenge will now be accessible on the docker host on port 8080.