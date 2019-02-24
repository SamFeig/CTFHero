# Search History

Some websites store users searches in the database so that links to those searches are accessible later. This application emulates that functionality.

# How to Solve

1. Navigate to the homepage of the application and perform a search with the network tab open.
1. Inspect the result. In the response body you will see a `/searches/#num`. This number increases every time you search.
1. Browse directly to `<url>/searches/1` and you will see the results from that search but you will not see the actual query run.
1. Realize that the app is using json for some of its endpoints and browse directly to `<url>/searches/1.json` which will give you the actual query run, which in this case also contains the flag.

# Flag

MCA{just_browsin'_my_search_history}