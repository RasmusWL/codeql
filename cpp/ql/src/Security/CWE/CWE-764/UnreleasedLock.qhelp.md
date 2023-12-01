When a thread acquires a lock it must make sure to unlock it again; failing to do so can lead to deadlocks. If a lock allows a thread to acquire it multiple times, for example `std::recursive_mutex`, then the number of locks must match the number of unlocks in order to fully release the lock.


## Recommendation
The best way to ensure that locks are always unlocked is to use RAII (Resource Acquisition Is Initialization). That means acquiring the lock in the constructor of a class, and releasing it in its destructor. A local-scoped instance of that class will then be destroyed when it leaves scope, even if an exception is thrown, ensuring that the lock is released.


## Example
In this example, the mutex may not be unlocked if the function returns early.

{% sample src="UnreleasedLockBad.cpp" %}
In this second example, we show a simple RAII wrapper class for `std::mutex`. Using this ensures that even in the case of the early return, the mutex is released.

{% sample src="UnreleasedLockGood.cpp" %}

## References
{% cwe-references %}
