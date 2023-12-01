Previous versions of SpiderMonkey permitted the use of `yield` expressions in functions not marked as generators. This is no longer supported, and is not compliant with ECMAScript 2015.


## Recommendation
Mark the enclosing function as a generator by replacing `function` with `function*`.


## Example
The following example uses `yield` to produce a sequence of indices, but the function `idMaker` is not marked as a generator:

{% sample src="examples/YieldInNonGenerator.js" %}
This is easily fixed by adding an asterisk to the `function` keyword:

{% sample src="examples/YieldInNonGeneratorGood.js" %}

## References
* Mozilla Developer Network: [function\*](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function*).
* Mozilla Developer Network: [yield](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/yield).
{% cwe-references %}
