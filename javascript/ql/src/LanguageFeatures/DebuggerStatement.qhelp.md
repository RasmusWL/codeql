The `debugger` statement should only be used during debugging, and should not appear in production code.


## Recommendation
Remove all `debugger` statements.


## Example
The following implementation of Quicksort contains a `debugger` statement which can be removed without affecting the program's functionality.

{% sample src="examples/DebuggerStatement.js" %}

## References
* Mozilla Developer Network: [The debugger statement](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/debugger).
{% cwe-references %}
