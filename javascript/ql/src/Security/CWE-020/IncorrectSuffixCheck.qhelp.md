The `indexOf` and `lastIndexOf` methods are sometimes used to check if a substring occurs at a certain position in a string. However, if the returned index is compared to an expression that might evaluate to -1, the check may pass in some cases where the substring was not found at all.

Specifically, this can easily happen when implementing `endsWith` using `indexOf`.


## Recommendation
Use `String.prototype.endsWith` if it is available. Otherwise, explicitly handle the -1 case, either by checking the relative lengths of the strings, or by checking if the returned index is -1.


## Example
The following example uses `lastIndexOf` to determine if the string `x` ends with the string `y`:

{% sample src="examples/IncorrectSuffixCheck.js" %}
However, if `y` is one character longer than `x`, the right-hand side `x.length - y.length` becomes -1, which then equals the return value of `lastIndexOf`. This will make the test pass, even though `x` does not end with `y`.

To avoid this, explicitly check for the -1 case:

{% sample src="examples/IncorrectSuffixCheckGood.js" %}

## References
* MDN: [String.prototype.endsWith](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith)
* MDN: [String.prototype.indexOf](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/indexOf)
{% cwe-references %}
