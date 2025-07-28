#pragma once
#ifndef PGPPROBLEMSPEC_H_
#define PGPPROBLEMSPEC_H_

#include <string>
#include <vector>

using namespace std;

// this is the base class for a problem specification. make a subclass to specify a problem
class pGPProblemSpec {
	public:
		// subclasses should override this with an implementation of the fitness function for the problem
		virtual float fitness(pGPExpr& e) = 0;

		// the constructor for any sub class should fill these out with lists of variables and functions that can be used in this problem
		vector<string> functions_;
		vector<string> vars_;
};

#endif
