If a class has a synchronized `set` method and a similarly-named `get` method is not also synchronized, calls to the `get` method may not return a consistent state for the object.


## Recommendation
Synchronize read operations as well as write operations. You should usually synchronize the `get` method.


## References
* Java Language Specification: [Synchronization](https://docs.oracle.com/javase/specs/jls/se11/html/jls-17.html#jls-17.1).
{% cwe-references %}
