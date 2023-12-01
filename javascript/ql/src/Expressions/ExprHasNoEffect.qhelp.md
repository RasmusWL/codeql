An expression that has no effects (such as changing variable values or producing output) and occurs in a context where its value is ignored possibly indicates missing code or a latent bug.


## Recommendation
Carefully inspect the expression to ensure it is not a symptom of a bug. To document that the value of an expression is deliberately ignored, wrap it into a `void` expression.


## Example
The following code snippet accesses the `selectedIndex` property of a DOM node to trigger additional processing in certain versions of Safari. This, however, is not clear from the code itself, which looks like a property read whose value is discarded immediately.

{% sample src="examples/ExprHasNoEffect.js" %}
To document the fact that the property read has a hidden side effect and its value is deliberately ignored, it should be wrapped into a `void` expression like this:

{% sample src="examples/ExprHasNoEffectGood.js" %}
A common source of warnings are constructor functions that "declare" a property of the newly constructed object without initializing it, by simply referring to it in an expression statement like this:

{% sample src="examples/ExprHasNoEffect-PseudoDecl.js" %}
Semantically, this is unnecessary, since the property will be created upon first assignment. If the aim is to document the existence of the property, it would be better to explicitly assign it an initial value, which also serves to document its expected type:

{% sample src="examples/ExprHasNoEffect-PseudoDeclGood.js" %}

## References
* JSLint Error Explanations: [Expected an assignment or function call](http://jslinterrors.com/expected-an-assignment-or-function-call).
{% cwe-references %}
