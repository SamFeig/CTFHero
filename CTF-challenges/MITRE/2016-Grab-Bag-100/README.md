Setup
=====

Navigate to the root folder of this repository and run the following command

    $ docker run -p 80:80 -p 443:443  --restart unless-stopped -v `pwd`/2016_heating_challenge/HTML:/var/www/html -d eboraas/apache

Solution
========

Under the folder HTMLOUT click the index.html and open it with a browser.
The goal is to overheat the heating coils and cause the webpage to provide a "error code" which so happens to be the MCA flag
The first step the user must take is to look up the main component, the CD74HC4067 multiplexer, online and obtain a datasheet.
The user has control of the digital pins on the microcontroller that are attached to the multiplexer.
The use should then look up the conditions required to see the multiplexer to the desired channel.
The goal is to connect both multiplexers together and make the temperature sensor read "-1" which makes the heater work without stopping
This is obtained with the following connections

key for completing challenge. Shown when temperature is 1100 MCA-20A5A578


D0: HIGH
D1: HIGH
D2: LOW
D3: HIGH
D4: LOW
D5: HIGH
D6: HIGH
D7: LOW
D8: LOW
D9: LOW