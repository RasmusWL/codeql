Mutexes come in two flavors: recursive and non-recursive. For example, the C++ mutex library provides both `std::mutex` and `std::recursive_mutex`. A non-recursive mutex cannot be locked until it has been unlocked by its previous owner, even if it is already owned by the current thread. Deadlock is often caused by a thread attempting to lock the same mutex twice, usually in a recursive algorithm.


## Recommendation
If a recursive method needs to acquire a lock, then split it into two methods. The first method is public and is responsible for locking and unlocking the mutex. It delegates the rest of the work to a second private method. The second method does not need to lock or unlock the mutex because that is done by the first method.


## Example
In this example, the method `f` is recursive, so it causes a deadlock by attempting to lock the mutex twice.

{% sample src="TwiceLockedBad.cpp" %}
In this second example, the recursion is delegated to an internal method so the mutex is only locked once.

{% sample src="TwiceLockedGood.cpp" %}

## References
{% cwe-references %}
