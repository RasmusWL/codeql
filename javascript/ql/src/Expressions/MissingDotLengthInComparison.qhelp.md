It is very common to check whether a number is within the bounds of an array or string using a comparison of form `i < array.length`, and later perform an indexing access `array[i]`. If this comparison is mistyped as `i < array`, a type coercion will be performed, which almost never has the intended effect.


## Recommendation
Check if one of the operands is an array or a string, and make sure to compare against its `length`, not against the value itself.


## Example
The following example shows a mistyped loop condition `i < array`:

{% sample src="examples/MissingDotLengthInComparison.js" %}
If the above is executed with `array` set to `[3,5,7]`, the loop will not run at all. The error can be corrected by changing the loop condition to `i < array.length`:

{% sample src="examples/MissingDotLengthInComparisonGood.js" %}

## References
* Mozilla Developer Network: [Array.length](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length)
{% cwe-references %}
