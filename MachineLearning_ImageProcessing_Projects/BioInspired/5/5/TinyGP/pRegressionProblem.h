#pragma once
#ifndef PREGRESSIONPROBLEM_H_
#define PREGRESSIONPROBLEM_H_

#include <vector>
#include <string>

#include "pVectorMultiPush.h"

using namespace std;

// this spec covers regression problems from |R->|R.
class pRegressionProblem : public pGPProblemSpec
{
	public:
		map<string, float> env_;
		vector<float>& inputs_;
		vector<float>& outputs_;

		pRegressionProblem(vector<float>& inputs, vector<float>& outputs, vector<string> vars) :	inputs_(inputs), outputs_(outputs){
			//vector_multi_push<string>(functions_, "+", "-", "*", "/", "cos", "sin", "tan", "exp");
			vector_multi_push<string>(functions_, "+", "*");
			vars_ = vars;
			env_["1"] = 1;
			env_["2"] = 2;
			env_["3"] = 3;
			env_["4"] = 4;
			env_["5"] = 5;
			env_["0"] = 0;
		}

		float fitness(pGPExpr& e){
			float error = 0;

			for(int i = 0; i < inputs_.size(); ++i){
				env_["x"] = inputs_[i];
				error += fabs(outputs_[i] - e.eval(env_));
			}
			return error;
		}
};

#endif
