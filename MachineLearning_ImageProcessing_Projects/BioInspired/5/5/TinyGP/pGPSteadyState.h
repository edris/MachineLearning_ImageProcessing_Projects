#pragma once
#ifndef PGPSTEADYSTATE_H_
#define PGPSTEADYSTATE_H_

#include <iostream>
#include <string>
#include <vector>
#include <queue>
#include <map>
#include <math.h>
#include <stdlib.h>
#include <assert.h>

#include "pGPExpr.h"
#include "pGPProblemSpec.h"
#include "pGPOperators.h"
#include "hr_time.h"
using namespace std;

// this is a steady state genetic algorithm for use with the above gp system
class pGPSteadyState {

	public:

	vector<pGPExpr*> population_;
	int populationSize_, tournamentSize_, maxDepth_, maxEvals_;
	float crossoverProb_;
	bool printNewExprs_, printBestEveryIteration_;
	pGPProblemSpec& spec_;
	int numEvals_;
	CStopWatch timer;

	// initialize the population by generating populationSize_ random individuals and evaluating them
	pGPSteadyState(int populationSize, int tournamentSize, int maxDepth, float crossoverProb, int maxEvals, bool printNewExprs, bool printBestEveryIteration,  pGPProblemSpec& spec) :
		populationSize_(populationSize), tournamentSize_(tournamentSize), maxDepth_(maxDepth), crossoverProb_(crossoverProb), maxEvals_(maxEvals), printNewExprs_(printNewExprs), printBestEveryIteration_(printBestEveryIteration), spec_(spec)
	{
		for(int i = 0; i < populationSize_; ++i) {
			pGPExpr* child = pGPOperators::randomExpr(maxDepth_, spec_.functions_, spec_.vars_);
			child->fitness_ = spec_.fitness(*child);
			population_.push_back(child);
		}
		numEvals_ = populationSize_;
	}
	
	// return the index in the population of the worst / best member
	int getExtremalMemberIndex(vector<pGPExpr*>& exprs, bool worst = true) {
		int worstIndex = 0;
		float worstEval = exprs[0]->fitness_;
		int worstSize = 0;

		for(int i = 1; i < exprs.size(); ++i){
			// break fitness ties by size
			// if fitness is not equal, then it is the basis for comparison
			if( ( exprs[i]->fitness_ == worstEval && ( worst ? (exprs[i]->size() > worstSize)   :  (exprs[i]->size() < worstSize) ) ) ||
													 ( worst ? (exprs[i]->fitness_ > worstEval) :  (exprs[i]->fitness_ < worstEval) ) )
			{
				worstEval = exprs[i]->fitness_;
				worstIndex = i;
				worstSize = exprs[i]->size();
			}
		}
		return worstIndex;
	}
	
	// return a pointer to the best of several randomly chosen members of the population
	pGPExpr* tournamentSelect(bool selectBest = true)	{

		vector<pGPExpr*> members;

		for(int i = 0; i < tournamentSize_; ++i){
			members.push_back(population_[rand() % populationSize_]);
		}

		return members[getExtremalMemberIndex(members, !selectBest)];
	}
	
	// return a pointer to the best expression in the population
	pGPExpr* getBestExpr() { return population_[getExtremalMemberIndex(population_,false)]; }
	
	// prints the expression, depth and fitness for the best expression so far
	void printBestExprInfo() {
		pGPExpr* bestExpr = getBestExpr();
		//cout << "best: "<< bestExpr->toString() << " depth= " << bestExpr->depth() << " size=" << bestExpr->size() << " fitness= " << bestExpr->fitness_ << " evals=" << numEvals_ << " avgFitness=" << getAverageFitness() << endl;
		cout << bestExpr->toString() << "," << bestExpr->depth() << "," << bestExpr->size() << "," << bestExpr->fitness_ << "," << numEvals_ << "," << getAverageFitness();
	}

	string getBestExprInfo(){

	}
	
	// returns true if a correct solution has been found
	bool foundSolution() {
		return population_[getExtremalMemberIndex(population_, false)]->fitness_ < 10E-5;
	}
	
	float getAverageFitness()
	{
		float sum = 0; 
		for(int i = 0; i < populationSize_; ++i) sum += population_[i]->fitness_;
		return sum / (float)populationSize_; 
	}
	
	// generate one new expression, evaluate it, and possibly insert it into the population
	void iterate() {

		// generate a new child with either mutation or crossover. tournament select parents
		pGPExpr* child;
		if( (float)rand() / (float)RAND_MAX > crossoverProb_ ){
			child = pGPOperators::mutate(tournamentSelect(), maxDepth_, spec_.functions_, spec_.vars_);
		}else {
			bool gotChildOfAcceptableDepth = false;
			while( !gotChildOfAcceptableDepth ) {
				child = pGPOperators::crossover(tournamentSelect(), tournamentSelect(), maxDepth_, spec_.functions_, spec_.vars_);
				if( child->depth() <= maxDepth_ )
					gotChildOfAcceptableDepth = true;
				else
					delete child;
			}
		}
		
		// compare child fitness to worst member of population and replace if better
		child->fitness_ = spec_.fitness(*child);
		++numEvals_;

		int worstIndex = getExtremalMemberIndex(population_);

		if( population_[worstIndex]->fitness_ > child->fitness_) {
			delete population_[worstIndex];
			population_[worstIndex] = child;
		}
				
		if( printNewExprs_ ){
			cout << "new:  " << child->toString() << " fitness=" << child->fitness_ << endl;
		}
	}
	
	void runExperiment() {
		timer.startTimer();

		// iterates up to maxEvals_ times, and stops if it finds a solution. prints info each iteration.
		while( numEvals_ < maxEvals_ ) {

			iterate();
			if( printBestEveryIteration_ ){
				printBestExprInfo();
				cout << endl;
			}

			if(foundSolution()){
				timer.stopTimer();
				printBestExprInfo();
				cout << "," << timer.getElapsedTime() << endl;
				return;
			}
		}
		timer.stopTimer();
		printBestExprInfo();
		cout << "," << timer.getElapsedTime() << endl;
	}
};

#endif
