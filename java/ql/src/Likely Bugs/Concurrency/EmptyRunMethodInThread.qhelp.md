New threads can be defined using one of the following alternatives:

* By extending the `Thread` class and overriding its `run` method.
* By passing an argument of type `Runnable` to the constructor of the `Thread` class.
Thread instances that are defined using another approach are likely to have no effect.


## Recommendation
To avoid empty thread instances, define new threads using one of the following alternatives:

* By extending the `Thread` class and overriding its `run` method.
* By passing an argument of type `Runnable` to the constructor of the `Thread` class.

## Example
In the following example, class `Bad` shows the definition of a thread that has no effect.

{% sample src="EmptyRunMethodInThread.java" %}
In the following example, class `GoodWithOverride` shows how to extend the `Thread` class and override its `run` method, and class `GoodWithRunnable` shows how to pass an argument of type `Runnable` to the constructor of the `Thread` class.

{% sample src="EmptyRunMethodInThreadGood.java" %}

## References
* Java API Specification: [Thread](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Thread.html).
* The Java Tutorials: [Defining and Starting a Thread](https://docs.oracle.com/javase/tutorial/essential/concurrency/runthread.html).
{% cwe-references %}
