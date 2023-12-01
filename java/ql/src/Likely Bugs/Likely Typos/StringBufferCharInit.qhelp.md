Passing a character to the constructor of `StringBuffer` or `StringBuilder` is probably intended to insert the character into the newly created buffer. In fact, however, the character value is converted to an integer and interpreted as the buffer's initial capacity, which may yield unexpected results.


## Example
The following example shows a class representing points in two-dimensional Cartesian coordinates. The `toString` method uses a `StringBuffer` to construct a human-readable representation of the form `(x, y)`, where `x` and `y` are the point's coordinates.

However, the opening parenthesis is passed to the `StringBuffer` constructor as character literal. Instead of being used to initialise the buffer's contents, the character is converted to the integer value 40 and interpreted as the buffer's initial capacity. Thus, the string representation returned by `toString` will be missing the opening parenthesis. (Note that passing a character to `append`, on the other hand, is unproblematic.)

{% sample src="StringBufferCharInit.java" %}

## Recommendation
If the character used to initialize the buffer is a character literal, simply replace it with the corresponding string literal. So, in our example, replace `new StringBuffer('(')` with `new StringBuffer("(")`. If the character is not a literal value, use method `String.valueOf` to convert it to a string.


## References
* J. Bloch and N. Gafter, *Java Puzzlers: Traps, Pitfalls, and Corner Cases*, Puzzle 23. Addison-Wesley, 2005.
* NetBeans IDE: [Java Hints](https://web.archive.org/web/20210117160808/http://wiki.netbeans.org/Java_Hints)
* PMD: [Rule StringBufferInstantiationWithChar](https://pmd.github.io/latest/pmd_rules_java_errorprone.html#stringbufferinstantiationwithchar)
* Java API: [StringBuffer](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/StringBuffer.html), [java.lang.StringBuilder](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/StringBuilder.html).
{% cwe-references %}
