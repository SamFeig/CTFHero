The original code can be found at https://www.idontplaydarts.com/2016/04/detecting-curl-pipe-bash-server-side/.  Changes were made to good.sh and bad.sh to make them reflect the competition environment more.
The correct answer can be retrieved by using curl to access the file and piping it to bash. The incorrect file will be sent if curl is used without piping to bash.

## To Deploy

Install docker and docker-compose and run `docker-compose up -d` on the host machine.

## To be provided to competitors

Check out our new product! http://server-ip/setup.bash. Why not install it as quick as possible, download and install it in one step!

## Solution

The following will spit out `echo "Cannot execute script!"`.

    curl http://server-ip/setup.bash | bash

Competitors will then need to check out what the actual contents of the file they downloaded is:

    curl http://server-ip/setup.bash | (sleep 3; cat)

They will then be presented with the flag.

Note: This challenge seems to have some timing errors when run locally on docker however it seems to work correctly when run directly on a linux host.