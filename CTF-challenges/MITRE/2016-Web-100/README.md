XSS is a challenge where competitors have to look into the HTML source code to find where an XSS attack is sending data.

There are two servers.  "Forum" is where the competitors start and the XSS attack is stored.  "Attacker" is the server 
the XSS connects to to send information.

## Running the Challenge

In order to stand up the challenge run `docker-compose up` from within the Attacker and Forum folders. Forum 
will then be accessible on port 80 with Attacker on port 81.

## Solution ##

Connect to /whereISend/a on Attacker to retrieve flag MCA-19C34A41.