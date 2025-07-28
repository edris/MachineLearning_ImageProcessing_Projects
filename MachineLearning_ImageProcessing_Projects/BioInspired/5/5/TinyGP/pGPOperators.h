#pragma once
#ifndef PGPOPERATORS_H_
#define PGPOPERATORS_H_

#include <string>
#include <vector>

using namespace std;

// this class defines random, mutation and crossover operators for expressions
class pGPOperators {

	public:

	// generate a random expression, using the grow method
		static pGPExpr* randomExpr(int maxDepth, vector<string>& functions, vector<string>& vars) {
			// make a random variable
			if( maxDepth <= 1 || (rand() % (functions.size() + vars.size()) < vars.size() ) ){
				return new pGPExpr(vars[rand()%vars.size()]);
			}

			// or pick a function to apply, find out how many arguments it takes, and recurse to generate them
			string funcName_ = functions[rand() % functions.size()];
			int numArgs = (funcName_ == "sin" || funcName_ == "cos" || funcName_ == "tan" || funcName_ == "exp") ? 1 : 2;
			vector<pGPExpr*> args;
			for(int i = 0; i < numArgs; ++i){
				args.push_back(randomExpr(maxDepth - 1, functions, vars));
			}

			return new pGPExpr(funcName_, args);
		}

		// mutate the expression e, by selecting a random subexpression of e, and replacing it with a new random expression
		static pGPExpr* mutate(pGPExpr* e, int maxDepth, vector<string>& functions, vector<string>& vars) {
			markRandomSubExpression(e);
			return mutateOrCrossoverRec(true, e, NULL, maxDepth, functions, vars);
		}

		// crossover expressions e1 and e2
		static pGPExpr* crossover(pGPExpr* e1, pGPExpr* e2, int maxDepth, vector<string>& functions, vector<string>& vars) {

			// mark a subexpression in e1 to replace
			markRandomSubExpression(e1);
			vector<pGPExpr*> e2subExprs;

			// get a list of all subexprs in e2, and pass a random one to crossoverRec
			getSubExprs(e2, e2subExprs);
			return mutateOrCrossoverRec(false, e1, e2subExprs[rand() % e2subExprs.size()], maxDepth, functions, vars);
		}

	private:
		// get a vector of pointers to every subexpression in an input expression
		static void getSubExprs(pGPExpr* e, vector<pGPExpr*>& outSubExprs) {
			queue<pGPExpr*> q;
			q.push(e);
			while(!q.empty()) {
				pGPExpr* currE = q.front(); q.pop();
				outSubExprs.push_back(currE);
				for( int i = 0; i < currE->args_.size(); ++i){
					q.push(currE->args_[i]);
				}
			}
		}

		// sets all marked_ flags in e to false, then sets a random one to true
		static void markRandomSubExpression(pGPExpr* e)	{
			vector<pGPExpr*> subExprs;
			getSubExprs(e, subExprs);
			for(int i = 0; i < subExprs.size(); ++i){
				subExprs[i]->marked_ = false;
			}
			subExprs[rand() % subExprs.size()]->marked_ = true;
		}

		// this is a helper function that does most of the work for mutate and crossover. swap is not used by mutate (pass NULL for it).
		static pGPExpr* mutateOrCrossoverRec(bool isMutate, pGPExpr* e, pGPExpr* swap, int maxDepth, vector<string>& functions, vector<string>& vars) {
			// if this is the marked expression, return the swap expr
			if( e->marked_ ) return isMutate ? randomExpr(maxDepth, functions, vars) : new pGPExpr(*swap);

			// recursively copy e until the marked expression is found
			if( e->args_.size() == 0)  return new pGPExpr(e->name_);
			vector<pGPExpr*> args;
			for(int i = 0; i < e->args_.size(); ++i){
				args.push_back(mutateOrCrossoverRec(isMutate, e->args_[i], swap, maxDepth - 1, functions, vars));
			}
			return new pGPExpr(e->name_, args);
		}
};

#endif
