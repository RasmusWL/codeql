Splitting a long string literal over multiple lines can often aid readability, but this also makes it difficult to notice whether a space is missing where the strings are concatenated.


## Recommendation
Check the string literal to see whether it has the intended text. In particular, look for missing spaces near line breaks.


## Example
The following example shows a text literal that is split over two lines and omits a space character between the two words at the line break.

{% sample src="examples/MissingSpaceInAppend.js" %}

## References
* Mozilla Developer Network: [Strings: Long literal strings](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#Long_literal_strings).
{% cwe-references %}
