You should avoid making calls to explicit garbage collection methods (`Runtime.gc` and `System.gc`). The calls are not guaranteed to trigger garbage collection, and they may also trigger unnecessary garbage collection passes that lead to decreased performance.


## Recommendation
It is better to let the Java Virtual Machine (JVM) handle garbage collection. If it becomes necessary to control how the JVM handles memory, it is better to use the JVM's memory and garbage collection options (for example, `-Xmx`, `-XX:NewRatio`, `-XX:Use*GC`) than to trigger garbage collection in the application.

The memory management classes that are used by Real-Time Java are an exception to this rule, because they are designed to handle garbage collection differently from the JVM default.


## Example
The following example shows code that makes connection requests, and tries to trigger garbage collection after it has processed each request.

{% sample src="GarbageCollection.java" %}
It is better to remove the call to `System.gc` and rely on the JVM to dispose of the connection.


## References
* Java API Specification: [System.gc()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/System.html#gc()).
* Java Documentation: [HotSpot Virtual Machine Garbage Collection Tuning Guide](https://docs.oracle.com/en/java/javase/11/gctuning/index.html).
{% cwe-references %}
