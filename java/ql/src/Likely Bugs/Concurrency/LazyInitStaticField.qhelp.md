The tactic of initializing a static field the first time it is used, known as "lazy initialization", can be problematic in a multi-threaded context when used without proper synchronization. If a separate thread starts executing before the field is initialized, the thread may see an incompletely initialized object.


## Recommendation
If lazy initialization is desirable for performance reasons, the best solution is usually to declare the enclosing method `synchronized`. Otherwise, avoid lazy initialization and initialize static fields using static initializers. A third possibility is to declare the field `volatile` and use the double-checked locking idiom as explained in the article referenced below. As the article points out, it is crucial to declare the field `volatile`: double-checked locking by itself is *not* correct under the Java memory model.


## Example
In the following example, the static field `resource` is initialized without synchronization.

{% sample src="LazyInitStaticField.java" %}
In the following modification of the above example, `Singleton` uses the recommended approach of using a static initializer to initialize `resource`.

{% sample src="LazyInitStaticFieldGood.java" %}

## References
* University of Maryland Department of Computer Science: [The "Double-Checked Locking is Broken" Declaration](http://www.cs.umd.edu/~pugh/java/memoryModel/DoubleCheckedLocking.html).
{% cwe-references %}
