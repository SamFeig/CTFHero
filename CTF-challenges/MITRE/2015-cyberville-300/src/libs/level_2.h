#ifndef Level_2_h
#define Level_2_h 

#include <iostream>
#include <stdlib.h>
#include <time.h>
#include <cctype>
#include <algorithm>
#include "neural_network.h"

class Level2 {
public:
	Level2();

	bool update(int &step);
	bool done();
	char* getDials();

private:
	
	bool unlocked;
	std::string errmsg;

	Neuron *sw1, *sw2, *sw3, *sw4;
	Neuron *mid1, *mid2, *mid3;
	Neuron *lt1, *lt2, *lt3;

	int reg1, reg2, reg3;
	float l1, l2, l3;

	void print_status();
	void sleep(unsigned int mseconds);
	void clean_input(std::string s);
	void updateNeurons(int a, int b, int c, int d);
};

#endif
