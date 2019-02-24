Implementation:

This challenge uses PHP, HTML, and MySQL in its implementation.
PHP5 must be installed. In the lines ';extension=php_mysqli.dll' and either '; extension_dir = "./"' (linux) or '; extension_dir = "ext"' (on windows) in php.ini must have the ';' removed. If there is no php.ini file, copy either php.ini-development or php.ini-production into a file called php.ini. Add php to your PATH.
A MySQL Database must then be installed. Create a new table called ctf with the following columns: A unique auto-incrementing index/primary key, a unique non-null 'name' field, and a non-null 'password' field.
Change lines 13-15 of setup/setupdb.php so that they have the proper credentials. Once this is done, run setup/setupdb.php. This creates 89,999 users with random names and passwords and 1 user with the flag for the password.
You should then add the ctfuser to MySQL. Create a new user with the credentials present in utils/cred.php. Grant that user permissions only to select from the ctf schema.
You will need to change the filepath on line 26 in rootfolder/retrieve.php so that it points to the correct location of utils/cred.php. You will also have to edit the $servername variable in utils/cred.php if it needs to point to MySQL non-locally.
Finally, you must have a PHP-capable webserver on the system which will serve rootfolder/retrievepassword.html and retrieve.php, and ONLY those files.

Solution:
The Username box has in it a default value of Firstname_Lastname, indicating the format for username inputs. Submitting this 'default' value will give the response "Username not found. Please enter another username and try again."
Trying a very common Firstname_Lastname format, such as John_Smith, will get a response of echo "Thank you for your request. A password will be sent to your email soon." (Usernames are generated based on every combination of the 300 most common first and last names, so many common name combinations will work.) This tells us that we will probably get one of two responses: either username not found or username sent. We can't get much more information from this form.
The most sensible queries which may be sent to obtain this information would be "SELECT * FROM tablename WHERE username='Firstname_Lastname'" or "SELECT COUNT(*) as something WHERE username='Firstname_Lastname'", with Firstname_Lastname as a variable.
The user may try using another select statement, but will find that the keywords Select, Update, Insert, and Delete are all disallowed from the input. So they can still only determine whether or not a particular user exists.
It makes sense to assume that one of the passwords is the flag. Instead of using injecting to find information about the users, injection should be used to find information about the existance of particular passwords.
We can't brute-force try to guess the exact password and see if it's somewhere in the database, but we can guess what the password is like.
So, since we know flags start with MCA, we'll start with the following string in the field of username:
' OR password LIKE 'MCA-%
Which should make the query:
SELECT * FROM tablename WHERE username='' OR password LIKE 'MCA-%'
And we get the response "Thank you for your request. A password will be sent to your email soon."
Now that we know that a password with this start exists, we just have to get the rest of the characters. We can do this by determining what the next letter is character-by-character in the following manner:
Step 1:
Text input:' OR password LIKE 'MCA-0%
Response: "Thank you for your request. A password will be sent to your email soon."
Information: Someone has a password beginning with MCA-0, so we probably found the first hex digit (unless there are red herrings, which there aren't in this challenge)
Step 2:
Text input:' OR password LIKE 'MCA-00%
Response: "Username not found. Please enter another username and try again."
Information: No one has a password beginning with MCA-00
A few steps later...:
Text input:' OR password LIKE 'MCA-05%
Response: "Thank you for your request. A password will be sent to your email soon."
Information: Someone has a password beginning with MCA-05, so we probably found the second hex digit.

This would have to continue until they found the whole flag. This could take a while; there are 16 possible characters per hex digit, and 8 hex digits, giving 128 distinct entries into the text field before finding the flag using this method, if the last digit tried is always the digit that is used. However, if the user enters digits in order 0-F, since the flag is MCA-05021991, the number of entries to get the full flag will be:
(0+5+0+2+1+9+9+1)+8=35

With a little more intelligence in our query design, we can do a binary search as part of our sql injection, with something like:
' OR password < 'MCA-88888888
either for all of the queries, or to narrow down the possibilities before doing character-by-character entry.

To Deploy:

Pull this repository
Run `docker-compose up -d`