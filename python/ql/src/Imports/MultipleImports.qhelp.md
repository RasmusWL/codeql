Importing the same module more than once has no effect as each module is only loaded once. It also confuses readers of the code.


## Recommendation
Remove the second import.


## Example
{% sample src="MultipleImports.py" %}

## References
* Python: [import statement](http://docs.python.org/reference/simple_stmts.html#import).
{% cwe-references %}
