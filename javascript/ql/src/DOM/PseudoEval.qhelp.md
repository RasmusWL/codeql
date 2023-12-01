Several DOM functions allow evaluating strings as code without using `eval` explicitly. They should be avoided for the same reason as `eval` itself.


## Recommendation
When calling `setTimeout` or `setInterval`, do not pass it a string to evaluate but a function.

Instead of using `document.write` to insert raw HTML into the DOM, use a framework such as [jQuery](http://jquery.com).


## Example
In the following example, `setTimeout` is used to register a callback. The code to execute once the timeout expires is given as a string; this is bad practice.

{% sample src="examples/PseudoEval.js" %}
Instead, directly pass the function to be invoked to `setTimeout` like this:

{% sample src="examples/PseudoEvalGood.js" %}

## References
* D. Crockford, *JavaScript: The Good Parts*, Appendix B.3. O'Reilly, 2008.
{% cwe-references %}
