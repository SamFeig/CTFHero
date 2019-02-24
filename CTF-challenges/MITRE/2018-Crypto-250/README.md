# Online Game That Reaches Back To Server For Next Level (HARD) (OGTRBTSFNL_hard)

## How to Run Client

1. Run preInstal.sh this installs 32 bit libraries that the game needs
1. once it is complete the game will run automatically and should also be fully installed with a icon to re-run 

## How to Run Server
1. Configure nodeJS for your OS
1. run the server, it runs on port 6900

This is a online game with a Game Maker Studio client and a nodeJS server. To run it requires NodeJS and applications are included for windows and linux for testing

## How to solve ##
1. analyze network traffic to obtain the AES key that the client/server use to comunicate 
1. Create a faux client, (python example provided) to connect to the real server
1. send the correct data needed to complete the level, x , y, room index; 
1. read the data, the server should send the next room data followed by the encoded flag if you did it correctly. 


------how it works-----------

Python simulated server emulates real game server, when client connects to emualted server the server sends 
the command that makes the client go to room 4 which has the MCA key on it


# Flag

flag is: MCA{JG04fNo0bNumyipYapskiddleBop}


