# Cyberville Level 1 (50pt and 100pt Challenge)

This is a primarily web-based challenge, where the user is given an IP address to start out, and must traverse a series of network camera interfaces in order to gain the keys and, in turn, access to the city's "eyes".

Each of the directories in this repo (camera0-5) represent a web interface, each placed on a different port on a docker service.

#### To build
1. Pull the repository
2. Run ```docker-compose up -d```

Note: Video URLs must be assigned for Youtube streams.

#### Solution

1. Visit ```[CHALLENGE IP]:1800/index.html``` . 
2. Scan the QR code with an app like [Google Goggles](https://play.google.com/store/apps/details?id=com.google.android.apps.unveil) or [ZXing Decoder](http://zxing.org/w/decode.jspx), and record the relevant information.
3. Click the ```Next``` arrow.
4. Enter the username and password obtained from the QR code in the authentication box when prompted.
5. Click the ```Next``` arrow.
6. When prompted with the authentification box, search the default vendor username and password information on Google. Enter defaults until something works. This is the information for [Edimax](http://www.edimax.us/html/Faq/FAQ_CameraReset.htm).
7. Concatenate the pieces of the flag found so far to form the key. Enter the first key into the scoreboard for 50 points.
8. Click ```Next``` arrow.
9. Change the ending of the url to be ```/``` rather than ```/404.html``` to view the directory structure.
10. Click on the ```hidden/``` directory.
11. Download ```index.png``` and save it as ```index.html```.
12. Open ```index.html``` and open the html inspector. Record the port mapped to clicking the right arrow. Enter ```[CHALLENGE IP]:[RECORDED IP]/index.html``` into the browser URL bar.
13. Open the html inspector, and look at the script tag in the head of the html and notice the url. Navigate to that port with the same ```[CHALLENGE IP]```.
14. Open the html inspector, and set the visibility of the div with the id ```blur``` to ```visibility: hidden;``` in the css element.style editor.
15. Concatenate the pieces of the flag from these parts of the challenge to form the final key. Enter the final key to scoreboard for 100 points.


Keys:

MCA-73E94D62 (50pts)
MCA-CD47E4D4 (100pts)
