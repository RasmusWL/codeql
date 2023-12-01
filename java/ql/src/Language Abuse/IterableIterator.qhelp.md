{% render "IterableOverview.inc.qhelp.md" %}


## Recommendation
When working with custom implementations of `Iterator<T>` it is easy to add `implements Iterable<T>` and a simple `return this;` implementation of `iterator()` to support the for-each syntax. This can, however, hide subtle bugs and is therefore not recommended. It is better to separate the two and use a main representation that only implements `Iterable<T>` without containing any iteration state. This object can then return a short-lived `Iterator<T>` each time it needs to be traversed.

If this refactoring is undesirable for some reason, then the `iterator()` method should at the very least throw an exception if called more than once.


## Example
The following example does not distinguish the iterable from its iterator, and therefore causes the second loop to terminate immediately without any effect.

{% sample src="IterableIteratorBad.java" %}
The best solution is a refactoring along the following lines where `Iterable` classes are used to pass around references to data. This allows the `Iterator` instances to be short-lived and avoids the sharing of iteration state.

{% sample src="IterableIteratorGood1.java" %}
If a refactoring, as described above, is too cumbersome or is otherwise undesirable, then a guard can be inserted, as shown below. Using a guard ensures that multiple iteration fails early, making it easier to find any related bugs. This solution is less ideal than the refactoring above, but nevertheless an improvement over the original.

{% sample src="IterableIteratorGood2.java" %}

## References
* Java Language Specification: [The enhanced for statement](https://docs.oracle.com/javase/specs/jls/se11/html/jls-14.html#jls-14.14.2).
* Java API Specification: [Interface Iterable&lt;T&gt;](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Iterable.html), [Interface Iterator&lt;T&gt;](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Iterator.html), [Interface DirectoryStream&lt;T&gt;](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/nio/file/DirectoryStream.html).
{% cwe-references %}
