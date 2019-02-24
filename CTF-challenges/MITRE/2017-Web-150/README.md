# Captcha #
Captcha has a broken captcha for users to solve.  It produces 6 broken images and asks users to solve it.

## Solution ##

The flag (MCA{LIzdfHTUNUuZBhFKW20CChxJbRSNZbvv0SGnyEXkcrn9bPEz}) can be found by running the testCap python script.
The script queries the captcha validation endpoint and will try every response for each captcha.
A valid response returns only one character of the 53 character flag, so the script builds a complete flag.