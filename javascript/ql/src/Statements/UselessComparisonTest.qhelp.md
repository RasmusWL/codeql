If a condition always evaluates to true or always evaluates to false, this often indicates incomplete code or a latent bug, and it should be examined carefully.


## Recommendation
Examine the surrounding code to determine why the condition is redundant. If it is no longer needed, remove it.

If the check is needed to guard against `NaN` values, insert a comment explaining the possibility of `NaN`.


## Example
The following example finds the index of an element in a given slice of the array:

{% sample src="examples/UselessComparisonTest.js" %}
The condition `i < end` at the end is always false, however. The code can be clarified if the redundant condition is removed:

{% sample src="examples/UselessComparisonTestGood.js" %}

## References
* Mozilla Developer Network: [Truthy](https://developer.mozilla.org/en-US/docs/Glossary/Truthy), [Falsy](https://developer.mozilla.org/en-US/docs/Glossary/Falsy).
{% cwe-references %}
