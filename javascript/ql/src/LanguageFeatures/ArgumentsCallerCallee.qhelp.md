The `arguments.callee` property can be used to access the currently executing function, while the non-standard `arguments.caller` property provides access to its caller. Using these properties makes code hard to read, however, so they should be avoided.


## Recommendation
Instead of using `arguments.callee`, you can refer to the enclosing function by its name (possibly giving it a name first if it is an anonymous function expression). Uses of `arguments.caller` can often be eliminated by refactoring the program.


## Example
In the following example, `arguments.callee` is used to recursively invoke the enclosing function, which is anonymous.

{% sample src="examples/ArgumentsCallerCallee.js" %}
To avoid this use, the function can be given a name and referred to using that name:

{% sample src="examples/ArgumentsCallerCalleeGood.js" %}

## References
* Mozilla Developer Network: [arguments](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions_and_function_scope/arguments).
{% cwe-references %}
