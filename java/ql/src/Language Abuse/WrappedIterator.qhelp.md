{% render "IterableOverview.inc.qhelp.md" %}


## Recommendation
When writing the `iterator()` method in an `Iterable<T>` then it is important to make sure that each call will result in a fresh `Iterator<T>` instance containing all the necessary state for keeping track of the iteration. If the iterator is stored in the `Iterable<T>`, or somehow refers to iteration state stored in the `Iterable<T>`, then subsequent calls to `iterator()` can result in loops that only traverse a subset of the elements or have no effect at all.


## Example
The following example returns the same iterator on every call, and therefore causes the second loop to terminate immediately without any effect.

{% sample src="WrappedIteratorBad1.java" %}
This second example returns a newly created iterator each time, but still relies on iteration state stored in the surrounding class, and therefore also causes the second loop to terminate immediately.

{% sample src="WrappedIteratorBad2.java" %}
The code should instead be written like this, such that each call to `iterator()` correctly gives a fresh iterator that starts at the beginning.

{% sample src="WrappedIteratorGood.java" %}

## References
* Java Language Specification: [The enhanced for statement](https://docs.oracle.com/javase/specs/jls/se11/html/jls-14.html#jls-14.14.2).
* Java API Specification: [Interface Iterable&lt;T&gt;](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Iterable.html), [Interface Iterator&lt;T&gt;](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Iterator.html), [Interface DirectoryStream&lt;T&gt;](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/nio/file/DirectoryStream.html).
{% cwe-references %}
