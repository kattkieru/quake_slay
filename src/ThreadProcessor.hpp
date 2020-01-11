#ifndef THREADPROCESSOR_HPP
#define THREADPROCESSOR_HPP

#include <functional>
#include <memory>
#include <queue>
#include <vector>
#include <thread>
#include <mutex>
#include <condition_variable>

typedef std::function<void()> ThreadTask;


// worker is a set of tasks executed per-thread
class Worker
{
public:
	Worker();
	~Worker();
	void AddTask(ThreadTask &&task);
	void Work();
	void WaitComplete();
	void Finish();
private:
	Worker(const Worker&) = delete;  // no copying
	Worker(Worker&&) = delete;       // no moving
	std::queue<ThreadTask> tasks;
	std::shared_ptr<std::thread> thread;
	bool finish = false;
};


class ThreadProcessor
{
public:
	~ThreadProcessor();

	const unsigned int NumThreads() const { return m_numThreads; }
	void SpawnWorkers();
	void AddTask(uint8_t threadId, ThreadTask &&task);
	void Wait();
	void Finish();
private:
	unsigned int m_numThreads = 1;
	std::vector<Worker> m_workers;
};

#endif
