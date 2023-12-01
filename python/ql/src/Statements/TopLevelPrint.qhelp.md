Using `print` statements in level scope may result in surprising output at import time. This in turn means that other code cannot safely import the module in question if the program may only write real output to standard out.


## Recommendation
Replace the `print` statements with calls to some form of logging function or use the `warnings` module.


## Example
In the example, importing the module may cause a message to be printed, which may interfere with the operation of the program.

{% sample src="TopLevelPrint.py" %}

## References
* Python Language Reference: [The print statement](http://docs.python.org/2/reference/simple_stmts.html#the-print-statement).
* Python Standard Library: [The print function](http://docs.python.org/3/library/functions.html#print).
* Python tutorial: [Modules](http://docs.python.org/2/tutorial/modules.html).
{% cwe-references %}
