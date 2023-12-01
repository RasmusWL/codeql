The dictionary returned by `locals()` is not a view of the function's locals, but a copy. Therefore, modification of the dictionary returned from `locals()` will not modify the local variables of the function.


## Recommendation
If the intention is to modify a local variable, then do so directly.


## Example
In this example, rather than assigning to the variable `z` directly, the dictionary returned by `locals()` is modified.

{% sample src="ModificationOfLocals.py" %}

## References
* Python Language Reference: [The for statement](http://docs.python.org/2/reference/compound_stmts.html#the-for-statement).
* Python Tutorial: [for statements](http://docs.python.org/2/tutorial/controlflow.html#for-statements).
{% cwe-references %}
