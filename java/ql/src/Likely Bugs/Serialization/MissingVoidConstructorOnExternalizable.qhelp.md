A class that implements `java.io.Externalizable` must have a public no-argument constructor. The constructor is used by the Java serialization framework when it creates the object during deserialization. If the class does not define such a constructor, the Java serialization framework throws an `InvalidClassException`.

The Java Development Kit API documentation for `Externalizable` states:

> When an `Externalizable` object is reconstructed, an instance is created using the public no-arg constructor, then the `readExternal` method called.


## Recommendation
Make sure that externalizable classes always have a no-argument constructor.


## Example
In the following example, `WrongMemo` does not declare a public no-argument constructor. When the Java serialization framework tries to deserialize the object, an `InvalidClassException` is thrown. However, `Memo` does declare a public no-argument constructor, so that the object is deserialized successfully.

{% sample src="MissingVoidConstructorOnExternalizable.java" %}

## References
* Java API Specification: [Externalizable](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/io/Externalizable.html).
{% cwe-references %}
