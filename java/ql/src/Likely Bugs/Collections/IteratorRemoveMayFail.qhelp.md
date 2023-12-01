The `remove` method of the `Iterator` interface is an optional operation. It is not supported by iterators on unmodifiable collections, or iterators on lists constructed by the `Arrays.asList` method. Invoking `remove` on such an iterator will lead to an `UnsupportedOperationException`.


## Recommendation
If a collection is meant to be modified after construction, use a modifiable collection type such as `ArrayList` or `HashSet`.


## Example
In the following example, the constructor `A(Integer...)` initializes the field `A.l` to `Arrays.asList(is)`. While the type of lists returned by `Arrays.asList` supports element updates through the `set` method, it does not support element removal. Hence the call to `iter.remove` on line 20 must fail at runtime.

{% sample src="IteratorRemoveMayFail.java" %}
To avoid this failure, copy the list returned by `Arrays.asList` into a newly created `ArrayList` like this:

{% sample src="IteratorRemoveMayFailGood.java" %}

## References
* Mark Needham: [Java: Fooled by java.util.Arrays.asList](https://dzone.com/articles/java-fooled).
{% cwe-references %}
