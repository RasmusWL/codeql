If a field is mostly accessed in a synchronized context, but occasionally accessed in a non-synchronized way, the non-synchronized accesses may lead to race conditions.


## Recommendation
Ensure that the non-synchronized field accesses are made synchronized, if required.


## Example
In the following example, `counter` is accessed in a synchronized way in *all but one* cases. If `modifyCounter` is called by a large number of threads that are running concurrently, the value of `counter` at the end of each call may not be zero. This is because the non-synchronized statement could be interleaved with updates to the counter that are performed by the other threads.

{% sample src="InconsistentAccess.java" %}
To correct this, the last statement of `modifyCounter` should be enclosed in a `synchronized` statement.


## References
* Java Language Specification: [Synchronization](https://docs.oracle.com/javase/specs/jls/se11/html/jls-17.html#jls-17.1).
{% cwe-references %}
