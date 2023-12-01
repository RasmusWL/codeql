The methods `notify`, `notifyAll`, and `wait` should only be called by a thread that is the owner of the object's monitor (intrinsic lock). In other words, the methods should only be called from within a synchronized statement or method. Otherwise the method call will throw `IllegalMonitorStateException`.


## Recommendation
Ensure that calls to `notify`, `notifyAll`, or `wait` are called from within a synchronized statement or method.


## Example
In the following example, the methods `produce` and `consume` use `wait` and `notifyAll` to communicate. However, the `consume` method is not synchronized, so the calls to `wait` and `notifyAll` will always throw an exception.

{% sample src="NotifyWithoutSynch.java" %}
To fix this example, add the `synchronized` keyword to the declaration of the `consume` method.


## References
* J. Bloch. *Effective Java (second edition)*, p. 276. Addison-Wesley, 2008.
* Java API Specification: [Object.notify()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#notify()), [Object.notifyAll()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#notifyAll()), [Object.wait()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#wait()), [Object.wait(long)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#wait(long)).
{% cwe-references %}
