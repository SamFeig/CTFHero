------------For End User------------------
Traffic Dots are actual devices used in roadways around the world for detecting car presence at intersections as well as highways. They communicate with the traffic light controller over an unprotected 2.4ghz connection. They report how many cars have passed as well as if a car is present over the sensor. These are battery powered devices that are put under roads and are expected to last from 5 to 10 years on battery. The more cars that go over the sensor the faster the battery will drain. The software to configure the Traffic Dots is openly given out by the manufacturer through some clever social engineering you managed to do. You put the software on your laptop and got the proper radio technology to use the software. You are near an intersection where the traffic is very busy in one direction but not the other. There has to be a way to increase traffic by modifying these Traffic Dots which may result in someone running a red light due to impatience.
Picture of what Traffic Dots look like
http://www.theblaze.com/wp-content/uploads/2014/04/Traffic-Sensors-Embedded.jpg

------------For White Cell------------------
flag = MCA-BC12D29D

To solve: Basically the only thing that must be done is to switch the frequencies of the north and south dots to east and west dot and the east and west dots to the north and south dots. So basically a flip flop of frequencies from N and S to E and W. This is desired to make the traffic controller think that there are no cars coming on a very busy intersection and that the empty side road has a ridiculous amount of cars. You may notice when switching frequencies that you will need a meaningless frequency as a place holder since no 2 dots can be on the same frequency and you need to switch every frequency.

Solver command: `cat solver.txt | ssh challenge@localhost -p2222`
