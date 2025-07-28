#pragma once
#ifndef PGPEXPR_H_
#define PGPEXPR_H_

#include <string>
#include <vector>

using namespace std;

// this class defines an expression, the organism of genetic programming
class pGPExpr {

	public:
		// this is the name of a variable, if this expression is a variable
		string name_;

		// a list of arguments, if this is an application (empty if its a variable)
		vector<pGPExpr*> args_;

		// this will be used to mark a subexpresesion for mutation
		bool marked_;

		// the fitness of the expression, if it has been evaluated
		float fitness_;

		// construct a variable expression
		pGPExpr(string name) : name_(name), marked_(false) {}

		// construct an application expression
		pGPExpr(string name, vector<pGPExpr*>& args) : name_(name), marked_(false) {
			for(int i = 0; i < args.size(); ++i){
				args_.push_back(args[i]);
			}
		}

		// copy constructor
		pGPExpr(const pGPExpr& e) : name_(e.name_), marked_(false) {
			for(int i = 0; i < e.args_.size(); ++i){
				args_.push_back(new pGPExpr(*e.args_[i]));
			}
		}

		// destructor
		~pGPExpr() {
			for(int i = 0; i < args_.size(); ++i){
				delete args_[i];
			}
		}

		// convert this expression to a string
		string toString() {
			if( args_.size() == 0 ){
				return name_;
			}

			string s = "(" + name_;
			for(int i = 0; i < args_.size(); ++i){
				s += " " + args_[i]->toString();
			}

			return s + ")";
		}

		// evaluate the expression expr, with variables defined in vars
		float eval(map<string, float>& env)	{
			// if there are 0 args, this is a variable
			if( args_.size() == 0 ){
				return env[name_];
			}

			// implementations of built in functions

			if(name_ == "+") return args_[0]->eval(env) + args_[1]->eval(env);
			if(name_ == "-") return args_[0]->eval(env) - args_[1]->eval(env);
			if(name_ == "*") return args_[0]->eval(env) * args_[1]->eval(env);
			if(name_ == "/")  { float denom = args_[1]->eval(env); if( denom == 0 ) return 0; return args_[1]->eval(env) / denom; }
			if(name_ == "sin") return sin(args_[0]->eval(env));
			if(name_ == "cos") return cos(args_[0]->eval(env));
			if(name_ == "tan") return tan(args_[0]->eval(env));
			if(name_ == "exp") return exp(args_[0]->eval(env));

			assert(false == "got unexpected function");

		}

		// returns the depth of this expression
		int depth()	{
			if( args_.size() == 0 ){
				return 1;
			}

			int maxDepth = 1;
			for(int i = 0; i < args_.size(); ++i){
				maxDepth = max(maxDepth, args_[i]->depth());
			}

			return maxDepth + 1;
		}

		// return the number of nodes in the expression
		int size() {
			if( args_.size() == 0 ){
				return 1;
			}

			int sum = 0;
			for(int i = 0; i < args_.size(); ++i){
				sum += args_[i]->size();
			}
			return 1 + sum;
		}
};

#endif
