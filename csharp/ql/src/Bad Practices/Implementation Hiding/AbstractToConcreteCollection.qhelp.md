Casting from an abstract collection to a concrete implementation is bad practice. It makes your code fragile because it becomes more difficult to change which implementation you are using at a later date.


## Recommendation
Consider using the abstract collection's methods and remove the cast.


## Example
The example shows casting from an `IEnumerable<string>` to a `List<string>`. This should be avoided where possible.

{% sample src="AbstractToConcreteCollectionBad.cs" %}

## References
* C\# Corner, [C\# Interface Based Development](https://www.c-sharpcorner.com/article/C-Sharp-interface-based-development/).
{% cwe-references %}
