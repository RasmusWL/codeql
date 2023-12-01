If the loop variable of a `for` loop ranges over the indices of an array, that variable would normally be used as an array index in the body of the loop. If, instead, the loop body only refers to array elements at constant indices, this may indicate a logic error or leftover testing code.


## Recommendation
Examine the loop carefully to ensure it is behaving as expected. You may want to consider using a `for`-`of` loop to iterate over all elements of an array without the need for error-prone index manipulations.


## Example
The following example shows a function that is intended to sum up the elements of an array `xs`. The loop variable `i` is counted up from zero to `xs.length-1`, but instead of adding `xs[i]` to the running sum `res`, the code adds `xs[0]`, the first element of `xs`, to it, which is likely a mistake:

{% sample src="examples/UnusedIndexVariable.js" %}
The problem can be fixed by adding `xs[i]` instead:

{% sample src="examples/UnusedIndexVariableGood.js" %}
Alternatively, the function can be written more succinctly using a `for`-`of` loop:

{% sample src="examples/UnusedIndexVariableGood2.js" %}

## References
* Mozilla Developer Network: [for](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for)
* Mozilla Developer Network: [for...of](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...of)
{% cwe-references %}
