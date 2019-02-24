# Cyberville Level 3 (300pt Challenge)

This is a primarily puzzle-solving challenge. The objective is to blackout the airport runway lights by overloading transformers. There are two sections to this challenge. The first is a set of logic gates that are controlled by 8 switches. The competitors are to try to figure out the relationships among the different gates and how to activate all of the lights, which will blow the primary transformer. That will enable the back-up power, which they must disable in the next level. Level 2 consists of a simplified neural network that takes inputs and maps them to outputs in a complex way. The key to the challenge is order in which commands are pushed into the regulator computer as opposed to the logic gate challenge, which is only dependent on a proper combination. This will simulate a dynamic grid defense system.

The key is encrypted with XOR 18 and checks are put in place to minimize any binary exploits.

####To build:
1. Pull the repository.
2. Run ```g++ -m32 -static -Ilibs/ neural_network.cpp level_2.cpp level_1.cpp main.cpp -o backdoor``` to compile the program.
3. Run ```chmod +x backdoor``` to allow the challenge to be run as an executable.
4. Run ```./backdoor``` to start the challenge.

####Level 1 Solution:
 - SWITCH 1: 	CLOSED
 - SWITCH 2: 	OPEN	
 - SWITCH 3: 	CLOSED	
 - SWITCH 4: 	OPEN	
 - SWITCH 5: 	OPEN	
 - SWITCH 6: 	OPEN	
 - SWITCH 7: 	CLOSED	
 - SWITCH 8: 	OPEN	


####Level 2 Solution:
 Keep firing the ```ABCD``` command from the resetted state until the regulator reaches 100% of Max Cap.


####Key: 
27be597a34de942bb17304e3fa6f723641995a65