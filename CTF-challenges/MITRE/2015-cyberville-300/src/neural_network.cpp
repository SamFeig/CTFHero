#include "neural_network.h"

using namespace std;

Neuron::Neuron(bool isInput, int thresh) {
	m_output = 0;
	m_is_input = isInput;
	m_thresh = thresh;
	m_sum = 0;
}

void Neuron::add_child(Neuron *child) {
	m_children.push_back(child);
}

void Neuron::compute() {
	if(!m_is_input){
		int i;
		for(i=0; i < m_children.size(); i++){
			m_children.at(i)->compute();
			m_sum += m_children.at(i)->get_output();
		}

		if(m_sum >= m_thresh){
			set_output(m_sum);
			m_sum = 0;
		}
	}
}

void Neuron::reset(bool resetChildren){
	m_sum = 0;
	set_output(0);
	if(resetChildren){
		int i;
		for(i=0; i < m_children.size(); i++){
			m_children.at(i)->reset(true);
		}
	}
}

void Neuron::set_output(int output) {
	m_output = output;
}

int Neuron::get_output() {
	return m_output;
}
