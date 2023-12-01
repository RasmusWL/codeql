A local variable is defined (by an assignment) but never used.

{% render "UnusedVariableNaming.inc.qhelp.md" %}

{% render "UnusedTuple.inc.qhelp.md" %}


## Recommendation
If the variable is included for documentation purposes or is otherwise intentionally unused, then change its name to indicate that it is unused, otherwise delete the assignment (taking care not to delete right hand side if it has side effects).


## Example
In this example, the `random_no` variable is never read but its assignment has a side effect. Because of this it is important to remove only the left hand side of the assignment in line 10.

{% sample src="UnusedLocalVariable.py" %}

## References
* Python: [Assignment statements](http://docs.python.org/2/reference/simple_stmts.html#assignment-statements).
{% cwe-references %}
