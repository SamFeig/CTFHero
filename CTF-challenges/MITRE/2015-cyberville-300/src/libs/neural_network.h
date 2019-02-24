#ifndef Neuron_h
#define Neuron_h

#include <iostream>
#include <stdlib.h>
#include <vector>

class Neuron {
public:
	Neuron(bool isInput, int thresh);

	void add_child(Neuron *child);

	void compute();

	void set_output(int output);
	int get_output();

	void reset(bool resetChildren);

private:
	std::vector<Neuron*> m_children;
	int m_output, m_thresh, m_sum;
	bool m_is_input;
};

#endif
