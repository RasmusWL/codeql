Calls to the `notify` method rather than `notifyAll` may fail to wake up the correct thread if an object's monitor (intrinsic lock) is used for multiple conditions. `notify` only wakes up a single arbitrary thread that is waiting on the object's monitor, whereas `notifyAll` wakes up all such threads.


## Recommendation
Ensure that the call to `notify` instead of `notifyAll` is a correct and desirable optimization. If not, call `notifyAll` instead.


## Example
In the following example, the methods `produce` and `consume` both use `notify` to tell any waiting threads that an object has been added or removed from the buffer. However, this means that only *one* thread is notified. The woken-up thread might not be able to proceed due to its condition being false, immediately going back to the waiting state. As a result no progress is made.

{% sample src="NotifyNotNotifyAll.java" %}
When using `notifyAll` instead of `notify`, *all* threads are notified, and if there are any threads that could proceed, we can be sure that at least one of them will do so.


## References
* J. Bloch. *Effective Java (second edition)*, p. 277. Addison-Wesley, 2008.
* Java API Specification: [Object.notify()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#notify()), [Object.notifyAll()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#notifyAll()).
{% cwe-references %}
