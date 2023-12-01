In most cases, calling the default implementation of `toString` in `java.lang.Object` is not what is intended when a string representation of an object is required. The output of the default `toString` method consists of the class name of the object as well as the object's hashcode, which is usually not what was intended.

This rule includes explicit and implicit calls to `toString` that resolve to `java.lang.Object.toString`, particularly calls that are used in print or log statements.


## Recommendation
For objects that are printed, define a `toString` method for the object that returns a human-readable string.


## Example
The following example shows that printing an object makes an implicit call to `toString`. Because the class `WrongPerson` does not have a `toString` method, `Object.toString` is called instead, which returns the class name and the `wp` object's hashcode.

{% sample src="DefaultToString.java" %}
In contrast, in the following modification of the example, the class `Person` does have a `toString` method, which returns a string containing the arguments that were passed when the object `p` was created.

{% sample src="DefaultToStringGood.java" %}

## References
* J. Bloch, *Effective Java (second edition)*, Item 10. Addison-Wesley, 2008.
* Java API Specification: [Object.toString()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#toString()).
{% cwe-references %}
