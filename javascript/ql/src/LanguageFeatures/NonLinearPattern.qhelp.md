If the same pattern variable is bound multiple times in the same object or array pattern, the last binding overwrites all of the earlier ones. This is most likely unintended and should be avoided.

In TypeScript, a common mistake is to try to write type annotations inside a pattern. This is not possible, and the type annotation should come after the pattern.


## Recommendation
Rename the pattern variables to have different names. In an array pattern, elements that do not need to be bound can be omitted.


## Example
In the following example, the function `distanceFromOrigin` uses an array pattern to decompose its argument `point`. The pattern binds `x` twice: first, `x` is bound to `point[0]`, the first element of `point`; this binding is then immediately overwritten by a binding to `point[1]`, which is probably unintended.

{% sample src="examples/NonLinearPattern.js" %}
From context, it appears that the second binding should have been for variable `y` like this:

{% sample src="examples/NonLinearPatternGood.js" %}
This can sometimes happen in TypeScript, due to the apparent similarity between property patterns and type annotations. In the following example, the function uses a pattern parameter with properties `x` and `y`. These appear to have type `number`, but are in fact untyped properties both stored in a variable named `number`.

{% sample src="examples/NonLinearPatternTS.ts" %}
It is not possible to specify type annotations inside a pattern. The correct way is to specify the type after the parameter:

{% sample src="examples/NonLinearPatternTSGood.ts" %}

## References
* Mozilla Developer Network: [Destructuring assignment](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment).
{% cwe-references %}
