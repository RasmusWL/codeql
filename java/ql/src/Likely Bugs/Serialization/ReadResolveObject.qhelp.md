If a class uses the `readResolve` method to specify a replacement object instance when the object is read from a stream, ensure that the signature of `readResolve` is *exactly* what the Java serialization mechanism expects.


## Recommendation
Ensure that the signature of the `readResolve` method in the class matches the expected signature:

` ANY-ACCESS-MODIFIER Object readResolve() throws ObjectStreamException; `

Note that the method *must* return a `java.lang.Object`.

If `readResolve` is used for instance control of a serializable singleton, (that is, to make sure that deserializing a singleton class does not result in another instance of the singleton) it may be possible to use an `enum` with a single element instead. The Java serialization specification explicitly ensures that deserializing an `enum` does not create a new instance. (For details about this technique, see \[Bloch\].)


## Example
In the following example, `FalseSingleton.readResolve` has the wrong signature, which causes deserialization to create a new instance of the singleton. However, `Singleton.readResolve` has the correct signature, which means that deserialization does not result in another instance of the singleton.

{% sample src="ReadResolveObject.java" %}

## References
* Java API Specification: [Serializable](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/io/Serializable.html).
* Java Object Serialization Specification: [3.7 The readResolve Method](https://docs.oracle.com/en/java/javase/11/docs/specs/serialization/input.html#the-readresolve-method), [1.12 Serialization of Enum Constants](https://docs.oracle.com/en/java/javase/11/docs/specs/serialization/serial-arch.html#serialization-of-enum-constants).
* J. Bloch, *Effective Java (second edition)*, Item 77. Addison-Wesley, 2008.
{% cwe-references %}
