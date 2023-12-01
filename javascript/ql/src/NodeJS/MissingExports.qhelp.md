Referencing an otherwise undeclared global variable in a module that exports a definition of the same name is confusing and may indicate a bug.


## Recommendation
If the global variable reference is intentional, consider adding a JSLint `/*global ...*/` directive or an externs declaration to declare the variable.

If the global variable reference is unintentional, qualifying the reference with `exports` will make it refer to the exported definition instead.


## Example
In the following example, the module exports two functions `checkOne` and `checkList`. The latter is also stored in a variable of the same name that is local to the module, but the former is not. Hence the call `checkOne(xs[i])` on line 7 does not refer to the function defined on line 1, but to an otherwise undeclared global variable also called `checkOne`.

{% sample src="examples/MissingExports.js" %}
Assuming that the intention is to call the `checkOne` function defined on line 1, the call should be qualified with `exports` like this:

{% sample src="examples/MissingExportsGood.js" %}

## References
* Node.js: [Modules](https://nodejs.org/api/modules.html).
* JSLint Help: [JSLint Directives](http://www.jslint.com/help.html).
* Closure Compiler: [Advanced Compilation and Externs](https://developers.google.com/closure/compiler/docs/api-tutorial3).
{% cwe-references %}
