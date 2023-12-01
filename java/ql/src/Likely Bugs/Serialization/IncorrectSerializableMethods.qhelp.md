A serializable object that defines its own serialization protocol using the methods `readObject`, `readObjectNoData` or `writeObject` must use the signature that is expected by the Java serialization framework. Otherwise, the default serialization mechanism is used.


## Recommendation
Make sure that the signatures of `readObject`, `readObjectNoData` and `writeObject` on serializable classes match these expected signatures:

{% sample src="IncorrectSerializableMethodsSig.java" %}

## Example
In the following example, `WrongNetRequest` defines `readObject`, `readObjectNoData` and `writeObject` using the wrong signatures. However, `NetRequest` defines them correctly.

{% sample src="IncorrectSerializableMethods.java" %}

## References
* Java API Specification: [Serializable](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/io/Serializable.html).
* Oracle Technology Network: [Discover the secrets of the Java Serialization API](https://www.oracle.com/technical-resources/articles/java/serializationapi.html).
{% cwe-references %}
