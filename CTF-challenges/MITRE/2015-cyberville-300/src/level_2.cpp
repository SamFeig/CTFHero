#include "level_2.h"

using namespace std;

Level2::Level2(){
	unlocked = false;
	errmsg = "";

	sw1 = new Neuron(true, 0);
	sw2 = new Neuron(true, 0);
	sw3 = new Neuron(true, 0);
	sw4 = new Neuron(true, 0);
	mid1 = new Neuron(false, 60);
	mid2 = new Neuron(false, 5);
	mid3 = new Neuron(false, 40);
	lt1 = new Neuron(false, 60);
	lt2 = new Neuron(false, 30);
	lt3 = new Neuron(false, 100);

	mid1->add_child(sw3);
	mid2->add_child(sw2);
	mid2->add_child(sw4);
	mid3->add_child(sw1);
	mid3->add_child(sw3);

	lt1->add_child(mid2);
	lt2->add_child(mid1);
	lt2->add_child(mid2);
	lt2->add_child(mid3);
	lt3->add_child(mid2);
	lt3->add_child(mid3);

	reg1 = 1;
	reg2 = 1;
	reg3 = 1;

	float total = (reg1 + reg2 + reg3) * 1.0;
	l1 = (reg1 / total * 100.0) + 1.7;
	l2 = (reg2 / total * 100.0) + 1.7;
	l3 = (reg3 / total * 100.0) + 1.7;
}

void Level2::sleep(unsigned int mseconds)
{
    clock_t goal = mseconds*1000 + clock();
    while (goal > clock());
}

char* Level2::getDials(){
	if(unlocked){
		char* dials = new char[4];
		dials[0] = '-';
		dials[1] = 'y';
		dials[2] = '.';
		dials[3] = '-';
		return dials;
	}
}

bool Level2::update(int &step){

	cout << "SECONDARY POWER ROUTING" << endl;

	if(unlocked){
		cout << endl << "WARNING!!! BACK-UP TRANSFORMER HAS BLOWN! EXTREME FAILURE!!!" << endl;
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
		clean_input(input);

		errmsg = "";
		
		if (input == "A") {
			updateNeurons(8, 0, 0, 0);
		} else if (input == "B") {
			updateNeurons(0, 8, 0, 0);
		} else if (input == "C") {
			updateNeurons(0, 0, 8, 0);
		} else if (input == "D") {
			updateNeurons(0, 0, 0, 8);
		} else if (input == "AB") {
			updateNeurons(4, 4, 0, 0);
		} else if (input == "AC") {
			updateNeurons(4, 0, 4, 0);
		} else if (input == "AD") {
			updateNeurons(4, 0, 0, 4);
		} else if (input == "BC") {
			updateNeurons(0, 4, 4, 0);
		} else if (input == "BD") {
			updateNeurons(0, 4, 0, 4);
		} else if (input == "CD") {
			updateNeurons(0, 0, 4, 4);
		} else if (input == "ABC") {
			updateNeurons(2, 2, 2, 0);
		} else if (input == "ABD") {
			updateNeurons(2, 2, 0, 2);
		} else if (input == "ACD") {
			updateNeurons(2, 0, 2, 2);
		} else if (input == "BCD") {
			updateNeurons(0, 2, 2, 2);
		} else if (input == "ABCD") {
			updateNeurons(1, 1, 1, 1);
		} else if (input == "reset" || input == "RESET") {
			reg1 = 1;
			reg2 = 1;
			reg3 = 1;
			lt1->reset(true);
			lt2->reset(true);
			lt3->reset(true);
		} else if (input == "exit" || input == "quit"){
			running = false;
		} else if (input == "help" || input == "HELP") {
			errmsg = "Enter a set of inputs to fire in alphabetical order (ex: A, BC, ABD, BCD).";
			errmsg += "\nType \"reset\" to clear the regulator computer's memory.";
		} else {
			errmsg = "Not a valid command. Try typing \"help\".";
		}

		float total = (reg1 + reg2 + reg3) * 1.0;
		l1 = (reg1 / total * 100.0) + 1.7;
		l2 = (reg2 / total * 100.0) + 1.7;
		l3 = (reg3 / total * 100.0) + 1.7;

		if(l1 > 100.0 || l2 > 100.0 || l3 > 100.0){
			unlocked = true;
		}
	}

	return running;
}

void Level2::updateNeurons(int a, int b, int c, int d){
	sw1->set_output(a);
	sw2->set_output(b);
	sw3->set_output(c);
	sw4->set_output(d);

	lt1->compute();
	lt2->compute();
	lt3->compute();

	reg1 += lt1->get_output();
	reg2 += lt2->get_output();
	reg3 += lt3->get_output();
}

void Level2::clean_input(std::string s){
	transform(s.begin(), s.end(), s.begin(), (int(*)(int)) toupper);
	s.erase(remove_if(s.begin(), s.end(), ::isspace), s.end());
}

bool Level2::done(){
	return unlocked;
}

void Level2::print_status(){
	cout << endl << errmsg << endl << endl;

	cout.precision(3);
	cout << "\t\t\t ___________" << endl;
	cout << "\tSWITCH A: ---->\t|           |" << " ---- REGULATOR 1: " << l1 << " % of Max Cap." << endl;
	cout << "\tSWITCH B: ---->\t|           |" << " ---- REGULATOR 2: " << l2 << " % of Max Cap." << endl;
	cout << "\tSWITCH C: ---->\t|           |" << " ---- REGULATOR 3: " << l3 << " % of Max Cap." << endl;
	cout << "\tSWITCH D: ---->\t|___________|" << endl;
}

