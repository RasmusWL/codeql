Assigning a variable to itself is redundant and often an indication of a mistake in the code.


## Recommendation
Check the assignment carefully for mistakes. If the assignment is truly redundant and not simply incorrect then remove it.


## Example
In this example the programmer clearly intends to assign to `self.eggs` but made a mistake.

{% sample src="RedundantAssignment.py" %}

## References
* Python Language Reference: [ The assignment statement](http://docs.python.org/reference/simple_stmts.html#assignment-statements).
{% cwe-references %}
