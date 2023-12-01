If the contents of a collection or map are never accessed in any way, then it is useless and the code that updates it is effectively dead code. Often, such objects are left over from an incomplete refactoring, or they indicate an underlying logic error.


## Recommendation
Either remove the collection/map if it is genuinely unnecessary, or ensure that its elements are accessed.


## Example
In the following example code, the `reachable` method determines whether a node in a tree is reachable from `ROOT`. It maintains a set `reachableNodes`, which contains all nodes that have previously been found to be reachable. Most likely, this set is meant to act as a cache to avoid spurious recomputation, but as it stands the code never checks whether any node is contained in the set.

{% sample src="WriteOnlyContainer.java" %}
In the following modification of the above example, `reachable` checks the cache to see whether the node has already been considered.

{% sample src="WriteOnlyContainerGood.java" %}

## References
* Java API Specification: [Collection](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Collection.html), [Map](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Map.html).
{% cwe-references %}
