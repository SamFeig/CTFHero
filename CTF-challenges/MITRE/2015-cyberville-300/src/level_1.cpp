#include "level_1.h"

using namespace std;

Level1::Level1(){
	gate1 = false;
	gate2 = false;
	gate3 = false;
	gate4 = false;
	gate5 = false;
	gate6 = false;
	gate7 = false;
	gate8 = false;
	light1 = false;
	light2 = false;
	light3 = false;
	light4 = false;
	light5 = false;
	light6 = false;
	light7 = false;
	light8 = false;
	light9 = false;
	unlocked = false;
	errmsg = "";
}

void Level1::sleep(unsigned int mseconds)
{
    clock_t goal = mseconds*1000 + clock();
    while (goal > clock());
}

char* Level1::getFuses(){
	if(unlocked){
		char* fuses = new char[4];
		fuses[0] = ',';
		fuses[1] = ')';
		fuses[2] = '!';
		fuses[3] = '!';
		return fuses;
	}
}

bool Level1::update(int &step){

	cout << "PRIMARY POWER ROUTING" << endl;

	if(unlocked){
		cout << endl << "WARNING!!! PRIMARY TRANSFORMER HAS BLOWN! SWITCHING TO BACK-UP POWER!" << endl;
	}

	print_status();

	bool running = true;

	if(unlocked){
		cout << endl << endl;
		sleep(5500);
		cout << "." << endl;
		sleep(500);
		cout << "." << endl;
		sleep(500);
		cout << "." << endl;
		sleep(500);
		step++;
	} else {
		cout << endl << endl << ">> ";

		string input;
		cin >> input;

		errmsg = "";
		if(input == "toggle"){
			cout << endl << "Which switch? (1, 2, 3, 4, 5, 6, 7, 8)" << endl << ">> ";
			cin >> input;

			if(input == "1"){
				gate1 = !gate1;
			} else if (input == "2"){
				gate2 = !gate2;
			} else if (input == "3"){
				gate3 = !gate3;
			} else if (input == "4"){
				gate4 = !gate4;
			} else if (input == "5"){
				gate5 = !gate5;
			} else if (input == "6"){
				gate6 = !gate6;
			} else if (input == "7"){
				gate7 = !gate7;
			} else if (input == "8"){
				gate8 = !gate8;
			} else {
				errmsg = "Not a valid switch number.";
			}
		} else if (input == "1"){
			gate1 = !gate1;
		} else if (input == "2"){
			gate2 = !gate2;
		} else if (input == "3"){
			gate3 = !gate3;
		} else if (input == "4"){
			gate4 = !gate4;
		} else if (input == "5"){
			gate5 = !gate5;
		} else if (input == "6"){
			gate6 = !gate6;
		} else if (input == "7"){
			gate7 = !gate7;
		} else if (input == "8"){
			gate8 = !gate8;
		} else if (input == "exit" || input == "quit"){
			running = false;
		} else {
			errmsg = "Not a valid command. Try typing \"toggle\".";
		}

		updateLights();
	}

	return running;
}

void Level1::updateLights(){
	light1 = !(gate4 ^ gate8);			//NXOR
	light2 = (gate5 ^ gate7);			//XOR
	light3 = (light1 && light2);		//AND
	light4 = (gate7 ^ light3);			//XOR
	light5 = (gate3 ^ light4);			//XOR
	light6 = (light5 ^ gate2 ^ gate6);	//XOR
	light7 = (light6 ^ gate1);			//XOR
	light8 = !(gate2 ^ gate8);			//NXOR
	light9 = (light7 ^ light8 ^ gate6);	//XOR

	// Final lock to see if challenge is completed
	unlocked = (light1 && light2 && light3 
		&& light4 && light5 && light6 
		&& light7 && light8 && light9);
}

bool Level1::done(){
	return unlocked;
}

void Level1::print_status(){
	cout << endl << errmsg << endl << endl;

	string g1 = (gate1) ? "OPEN" : "CLOSED";
	string g2 = (gate2) ? "OPEN" : "CLOSED";
	string g3 = (gate3) ? "OPEN" : "CLOSED";
	string g4 = (gate4) ? "OPEN" : "CLOSED";
	string g5 = (gate5) ? "OPEN" : "CLOSED";
	string g6 = (gate6) ? "OPEN" : "CLOSED";
	string g7 = (gate7) ? "OPEN" : "CLOSED";
	string g8 = (gate8) ? "OPEN" : "CLOSED";

	string l1 = (light1) ? "ON" : "OFF";
	string l2 = (light2) ? "ON" : "OFF";
	string l3 = (light3) ? "ON" : "OFF";
	string l4 = (light4) ? "ON" : "OFF";
	string l5 = (light5) ? "ON" : "OFF";
	string l6 = (light6) ? "ON" : "OFF";
	string l7 = (light7) ? "ON" : "OFF";
	string l8 = (light8) ? "ON" : "OFF";
	string l9 = (light9) ? "ON" : "OFF";

	cout << "\tSWITCH 1: \t" << g1 << "\t|\tINDICATOR LIGHT 1:\t" << l1 << endl;
	cout << "\tSWITCH 2: \t" << g2 << "\t|\tINDICATOR LIGHT 2:\t" << l2 << endl;
	cout << "\tSWITCH 3: \t" << g3 << "\t|\tINDICATOR LIGHT 3:\t" << l3 << endl;
	cout << "\tSWITCH 4: \t" << g4 << "\t|\tINDICATOR LIGHT 4:\t" << l4 << endl;
	cout << "\tSWITCH 5: \t" << g5 << "\t|\tINDICATOR LIGHT 5:\t" << l5 << endl;
	cout << "\tSWITCH 6: \t" << g6 << "\t|\tINDICATOR LIGHT 6:\t" << l6 << endl;
	cout << "\tSWITCH 7: \t" << g7 << "\t|\tINDICATOR LIGHT 7:\t" << l7 << endl;
	cout << "\tSWITCH 8: \t" << g8 << "\t|\tINDICATOR LIGHT 8:\t" << l8 << endl;
	cout << "\t\t\t" << "\t|\tINDICATOR LIGHT 9:\t" << l9 << endl;
}
