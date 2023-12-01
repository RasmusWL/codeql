A global (module-level) variable is defined (by an assignment) but never used and is not explicitly made public by inclusion in the `__all__` list.

{% render "UnusedVariableNaming.inc.qhelp.md" %}

{% render "UnusedTuple.inc.qhelp.md" %}


## Recommendation
If the variable is included for documentation purposes or is otherwise intentionally unused, then change its name to indicate that it is unused, otherwise delete the assignment (taking care not to delete right hand side if it has side effects).


## Example
In this example, the `random_no` variable is never read but its assignment has a side effect. Because of this it is important to only remove the left hand side of the assignment in line 9.

{% sample src="UnusedModuleVariable.py" %}

## References
* Python: [Assignment statements](http://docs.python.org/reference/simple_stmts.html#assignment-statements), [The import statement](http://docs.python.org/reference/simple_stmts.html#the-import-statement).
* Python Tutorial: [Importing \* from a package](http://docs.python.org/2/tutorial/modules.html#importing-from-a-package).
{% cwe-references %}
