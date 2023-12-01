Avoid calling `System.runFinalizersOnExit` or `Runtime.runFinalizersOnExit`, which are considered to be dangerous methods.

The Java Development Kit documentation for `System.runFinalizersOnExit` states:

> This method is inherently unsafe. It may result in finalizers being called on live objects while other threads are concurrently manipulating those objects, resulting in erratic behavior or deadlock.

Object finalizers are normally only called when the object is about to be collected by the garbage collector. Using `runFinalizersOnExit` sets a Java Virtual Machine-wide flag that executes finalizers *on all objects with a `finalize` method* before the runtime exits. This would require all objects with finalizers to defend against the possibility of `finalize` being called when the object is still in use, which is not practical for most applications.


## Recommendation
Ensure that the code does not rely on the execution of finalizers. If the code is dependent on the garbage collection behavior of the Java Virtual Machine, there is no guarantee that finalizers will be executed in a timely manner, or at all. This may become a problem if finalizers are used to dispose of limited system resources, such as file handles.

Instead of finalizers, use explicit `dispose` methods in `finally` blocks, to make sure that an object's resources are released.


## Example
The following example shows a program that calls `runFinalizersOnExit`, which is not recommended.

{% sample src="CallsToRunFinalizersOnExit.java" %}
The following example shows the recommended approach: a program that calls a `dispose` method in a `finally` block.

{% sample src="CallsToRunFinalizersOnExitGood.java" %}

## References
* J. Bloch, *Effective Java (second edition)*, Item 7. Addison-Wesley, 2008.
* Java API Specification: [System.runFinalizersOnExit()](https://docs.oracle.com/javase/10/docs/api/java/lang/System.html#runFinalizersOnExit-boolean-), [Object.finalize()](https://docs.oracle.com/javase/10/docs/api/java/lang/Object.html#finalize--).
* Java API Specification: [Java Thread Primitive Deprecation](https://docs.oracle.com/javase/10/docs/api/java/lang/doc-files/threadPrimitiveDeprecation.html).
{% cwe-references %}
