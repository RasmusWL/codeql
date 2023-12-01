Non-standard language extensions such as expression closures or `let` expressions should be avoided, since they make code harder to read or reuse.


## Recommendation
Use standard language features instead. For instance, expression closures can be replaced by ECMAScript 2015 arrow functions, or alternatively by plain functions; `let` statements and expressions can be replaced by ECMAScript 2015 `let` declarations; and `for each ... in` statements can be replaced by ECMAScript 2015 `for ... of` statements.


## Example
The following example uses an expression closure with `map`:

{% sample src="examples/ExpressionClosures.js" %}
The equivalent code using an ECMAScript 2015 arrow function is as follows:

{% sample src="examples/ExpressionClosuresGood.js" %}
On ECMAScript 2015 platforms, a plain function can be used instead:

{% sample src="examples/ExpressionClosuresGood2.js" %}
As another example, consider this use of a `let` statement:

{% sample src="examples/LetStatement.js" %}
It can easily be replaced by a block-scoped `let` declaration:

{% sample src="examples/LetStatementGood.js" %}
Older versions of Firefox support a postfix notation for array comprehensions:

{% sample src="examples/PostfixComprehension.js" %}
This notation should be converted into the semantically equivalent prefix notation supported by newer browsers:

{% sample src="examples/PostfixComprehensionGood.js" %}

## References
* Mozilla Developer Network: [Arrow functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions).
* Mozilla Developer Network: [Non-standard let extensions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/let#Non-standard_let_extensions).
* Mozilla Developer Network: [for each...in](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for_each...in).
{% cwe-references %}
