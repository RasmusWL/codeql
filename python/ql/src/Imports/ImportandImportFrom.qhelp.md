Importing a module twice using the `import xxx` and `from xxx import yyy` is confusing.


## Recommendation
Remove the `from xxx import yyy` statement. Add `yyy = xxx.yyy` if required.


## Example
{% sample src="ImportandImportFrom.py" %}

## References
* Python Language Reference: [The import statement](http://docs.python.org/2/reference/simple_stmts.html#import).
{% cwe-references %}
