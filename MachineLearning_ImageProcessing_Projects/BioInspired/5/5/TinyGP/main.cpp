/*
 * Robert C. Green II
 * Biologically Inspired Computing - Assignment #5
 *
 * TinyGA Implementation
 */
#include <math.h>
#include <stdlib.h>
#include <fstream>

#include "pGPSteadyState.h"
#include "pRegressionProblem.h"

using namespace std;

int main (int argc, char * const argv[]){
	srand(time(NULL));

	//
	// Input and output vectors
	//
	vector<float> inputs;
	vector<float> outputs;
	vector<string> vars;
	ofstream myFile;

	//
	// Load inputs with given data range
	//
	for(int x=-10; x<11; x++){
		inputs.push_back(x);
	}

	//
	// Load outputs with given data range
	//
	outputs.push_back(153);	outputs.push_back(120);	outputs.push_back(91);	outputs.push_back(66);
	outputs.push_back(45);	outputs.push_back(28);	outputs.push_back(15); 	outputs.push_back(6);
	outputs.push_back(1); 	outputs.push_back(0); 	outputs.push_back(3);	outputs.push_back(10);
	outputs.push_back(21); 	outputs.push_back(36); 	outputs.push_back(55); 	outputs.push_back(78);
	outputs.push_back(105); outputs.push_back(136);	outputs.push_back(171); outputs.push_back(210);
	outputs.push_back(253);
	
	//
	// Add Constants
	//
	vars.push_back("0");	vars.push_back("1");	vars.push_back("2");	vars.push_back("3");
	vars.push_back("4");	vars.push_back("5");	vars.push_back("x");

	//
	// Create Problem
	//
	pRegressionProblem problem(inputs, outputs, vars);
	
	//
	// Iterate and display results
	//
	for(int x=0; x<20; x++){
		pGPSteadyState ga(
			1000,		// pop size
			20,			// tournament size
			4,			// maxdepth,
			.9,			// crossover probability
			3000,		// max evals
			false,		// print new expressions
			true,		// print best expr every iteration
			problem);	// problem spec

		ga.runExperiment();
		cout << endl << endl;
	}
	
	return 0;
}
