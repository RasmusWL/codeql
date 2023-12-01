A class that implements an ordering operator (`__lt__`, `__gt__`, `__le__` or `__ge__`) should implement all four in order that ordering between two objects is consistent and obeys the usual mathematical rules. If the ordering is inconsistent with default equality, then `__eq__` and `__ne__` should also be implemented.


## Recommendation
Ensure that all four ordering comparisons are implemented as well as `__eq__` and ` __ne__` if required.

It is not necessary to manually implement all four comparisons, the `functools.total_ordering` class decorator can be used.


## Example
In this example only the `__lt__` operator has been implemented which could lead to inconsistent behavior. `__gt__`, `__le__`, `__ge__`, and in this case, `__eq__` and `__ne__` should be implemented.

{% sample src="IncompleteOrdering.py" %}

## References
* Python Language Reference: [Rich comparisons in Python](http://docs.python.org/2/reference/datamodel.html#object.__lt__).
{% cwe-references %}
