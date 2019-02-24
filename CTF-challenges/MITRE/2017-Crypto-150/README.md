# StatiCrypt

we created a encrypted page from https://robinmoisson.github.io/staticrypt/

## How to Run

1. Open up the encrypted html page
1. Will decrypt another HTML page with the key `✈🍓`
1. Flag is on middle of outputted HTML page

## How to Solve

1. Find a list of emoticons, I found mine at http://unicode.org/emoji/charts/full-emoji-list.html and used sublime on the page source to make a array of emoticons. 
1. iterate through all 2 emoticon possibilities and check against the AES key
1. I modified the JS in the html page to just brute force the key, the solution is attached. 

We tried making a faster solver in Python but Python doesn't deal with unicode or emoticons very well. 

a java parser was made instead. It works faster than the in-browser soloution.  

# Flag

MCA{🌯🍩🍪🍍🌶🥑🍦🍅🍿🥗🌭🥓🐳🐔🐁}
