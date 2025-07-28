

#ifndef hr_timer
#include "hr_time.h"
#define hr_timer
#endif


CStopWatch::CStopWatch(){

}

void CStopWatch::startTimer( ) {
	gettimeofday(&start, 0);
}

void CStopWatch::stopTimer( ) {
	gettimeofday(&end, 0);
}


double CStopWatch::getElapsedTime() {
	timeval result;

	timersub(&end,&start,&result);
	return result.tv_sec + result.tv_usec/1000000.0;
}
