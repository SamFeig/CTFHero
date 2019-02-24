#ifndef Level_1_h
#define Level_1_h 

#include <iostream>
#include <stdlib.h>
#include <time.h>

class Level1 {
public:
	Level1();

	bool update(int &step);
	bool done();
	char* getFuses();

private:
	bool gate1, gate2, gate3, gate4, gate5, gate6, gate7, gate8;
	bool light1, light2, light3, light4, light5, light6, light7, light8, light9;
	bool unlocked;
	std::string errmsg;

	void print_status();
	void updateLights();
	void sleep(unsigned int mseconds);
};

#endif