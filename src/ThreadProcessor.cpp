#include "ThreadProcessor.hpp"
#include "Utils.hpp"

std::mutex taskMutex;
std::condition_variable cv;


Worker::Worker()
{
    thread = std::make_shared<std::thread>(&Worker::Work, this);
}

Worker::~Worker()
{
    Finish();
}

void Worker::AddTask(ThreadTask &&task)
{
    std::unique_lock<std::mutex> lock(taskMutex);
    tasks.emplace(task);
    cv.notify_one();
}

void Worker::Work()
{
    while (true)
    {
        ThreadTask execTask;
        std::unique_lock<std::mutex> queueLock(taskMutex);
        cv.wait(queueLock, [this]() { return !tasks.empty() || finish; });
        if(finish)
            break;
        execTask = tasks.front();

        // run task (no lock, so that more tasks can arrive during execution)
        queueLock.unlock();
        execTask();

        // remove from task list
        queueLock.lock();
        tasks.pop();
        cv.notify_one();
    }
}

void Worker::WaitComplete()
{
    std::unique_lock<std::mutex> queueLock(taskMutex);
    cv.wait(queueLock, [this]() { return tasks.empty(); });
}

void Worker::Finish()
{
    if (thread->joinable())
    {
        WaitComplete();
        taskMutex.lock();
        finish = true;
        cv.notify_one();
        taskMutex.unlock();
        thread->join();
    }
}

ThreadProcessor::~ThreadProcessor()
{
    Finish();
}

void ThreadProcessor::SpawnWorkers()
{
    if (m_workers.empty())
    {
        m_numThreads = std::thread::hardware_concurrency();
        LOG_MESSAGE("Found " << m_numThreads << " threads.");
        m_workers = std::vector<Worker>(m_numThreads);
    }
}

void ThreadProcessor::AddTask(uint8_t threadIdx, ThreadTask &&task)
{
    LOG_MESSAGE_ASSERT(!m_workers.empty(), "There are no active workers!");
    m_workers[threadIdx].AddTask(std::move(task));
}

void ThreadProcessor::Wait()
{
    for (auto &worker : m_workers)
    {
        worker.WaitComplete();
    }
}

void ThreadProcessor::Finish()
{
    for (auto &worker : m_workers)
    {
        worker.Finish();
    }
}
