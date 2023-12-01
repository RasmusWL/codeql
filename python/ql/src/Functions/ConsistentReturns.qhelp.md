When a function contains both explicit returns (`return value`) and implicit returns (where code falls off the end of a function) this often indicates that a return statement has been forgotten. It is best to return an explicit return value even when returning `None` because this makes it easier for other developers to read your code.


## Recommendation
Add an explicit return at the end of the function.


## Example
In the `check_state1` function, the developer probably did intend to use an implicit return value of `None` as this equates to `False`. However, the function in `check_state2` is easier to read.

{% sample src="ConsistentReturns.py" %}

## References
* Python Language Reference: [Function definitions](http://docs.python.org/2/reference/compound_stmts.html#function).
{% cwe-references %}
