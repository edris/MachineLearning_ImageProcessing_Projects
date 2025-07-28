#include <sys/time.h>
#include <sys/types.h>


#ifndef CSTOPWATCH_H_
#define CSTOPWATCH_H_

class CStopWatch {

	private:

		timeval start, end;

	public:
		CStopWatch();
		void startTimer();
		void stopTimer();
		double getElapsedTime();
};

#endif /* CSTOPWATCH_H_ */
