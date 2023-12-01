If a condition always evaluates to true or always evaluates to false, this often indicates incomplete code or a latent bug and should be examined carefully.


## Recommendation
Examine the surrounding code to determine why the condition is useless. If it is no longer needed, remove it.


## Example
The following example constructs an array `lines`, and then attempts to check whether it has any elements by means of an if conditional `if (!lines)`.

{% sample src="examples/UselessConditional.js" %}
Note that in JavaScript (unlike some other languages) arrays and objects are always considered to be true when evaluated in a Boolean context. The code should instead check `lines.length`:

{% sample src="examples/UselessConditionalGood.js" %}

## References
* Mozilla Developer Network: [Truthy](https://developer.mozilla.org/en-US/docs/Glossary/Truthy), [Falsy](https://developer.mozilla.org/en-US/docs/Glossary/Falsy).
{% cwe-references %}
