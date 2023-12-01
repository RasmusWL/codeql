Comparing two boxed primitive values using `==` or `!=` compares object identity, which may not be intended.


## Recommendation
Usually, you should compare non-primitive objects, for example boxed primitive values, by using their `equals` methods.


## Example
With the following definition, the method call `refEq(new Integer(2), new Integer(2))` returns `false` because the objects are not identical.

{% sample src="RefEqBoxedBad.java" %}
With the following definition, the method call `realEq(new Integer(2), new Integer(2))` returns `true` because the objects contain equal values.

{% sample src="RefEqBoxed.java" %}

## References
* J. Bloch and N. Gafter, *Java Puzzlers: Traps, Pitfalls, and Corner Cases*, Puzzle 32. Addison-Wesley, 2005.
* Java API Specification: [Object.equals()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#equals(java.lang.Object)), [Integer.equals()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Integer.html#equals(java.lang.Object)).
{% cwe-references %}
