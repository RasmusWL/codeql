A map, collection, string or array will always have size of at least zero. Checking that an object of one of these types has size greater than or equal to zero will always be true, while checking that it has size less than zero will always be false.


## Recommendation
For collections, maps and strings, if the intention was to check whether the object was empty, is it preferred to use the `isEmpty()` method. For arrays, check that the `length` field is greater than (**not** equal to) zero.


## Example
The following example shows creation of a file guarded by comparison of a string length with zero. This can result in the attempted creation of a file with an empty name.

{% sample src="ContainerSizeCmpZero.java" %}
In the following revised example, the check against zero has been replaced with a call to `isEmpty()`. This correctly guards against the attempted creation of a file with an empty name.

{% sample src="ContainerSizeCmpZeroGood.java" %}

## References
* Java API Specification: [ Collection.isEmpty()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Collection.html#isEmpty()), [ Map.isEmpty()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Map.html#isEmpty()), [ String.isEmpty()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/String.html#isEmpty()).
{% cwe-references %}
