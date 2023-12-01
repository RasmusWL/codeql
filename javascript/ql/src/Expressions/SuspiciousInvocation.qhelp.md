Attempting to invoke a non-function (that is, a primitive value or an object) will cause an exception at runtime. This applies both to calls using `new` and normal calls.


## Recommendation
Carefully inspect the invocation in question. If the problem was not detected during testing, this could either be because the invocation is in dead code, or because it is not covered by a test. In the former case, delete the dead code in question. In the latter case, consider adding a new test.


## Example
In the following example, function `processResponse` accepts an argument `response`, and, depending on the value of property `response.status`, does one of two things: if `response.status` is 200, it invokes a function `processResponseText` (not shown), and if that function returns an `error` value, it throws that value as an exception; otherwise, it invokes `error` to log the value of `response.status`.

{% sample src="examples/SuspiciousInvocation.js" %}
Note that due to JavaScript's scoping rules, `error` in the "else" branch actually refers to the `error` variable declared in the "then" branch (and not the global function of the same name). Since that variable is always `undefined` in the "else" branch, attempting to invoke it will result in an exception at runtime.

To fix this problem, `error` could be turned into a `let`-bound variable to avoid the accidental name capture:

{% sample src="examples/SuspiciousInvocationGood.js" %}
Alternatively, if ECMAScript 5 compatibility is desired, the `error` variable could be renamed instead, as in this example:

{% sample src="examples/SuspiciousInvocationGood2.js" %}

## References
* Mozilla Developer Network: [Calling functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions#Calling_functions).
{% cwe-references %}
