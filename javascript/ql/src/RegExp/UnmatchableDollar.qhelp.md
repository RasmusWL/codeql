The dollar character `$` in a regular expression only matches at the end of the input, or (for multi-line regular expressions) at the end of a line. If it is followed by a pattern that must match a non-empty sequence of (non-newline) input characters, it cannot possibly match, rendering the entire regular expression unmatchable.


## Recommendation
Examine the regular expression to find and correct any typos.


## Example
In the following example, the regular expression `/\.\(\w+$\)/` cannot match any string, since it contains a dollar assertion followed by an escape sequence that matches a closing parenthesis.

{% sample src="examples/UnmatchableDollar.js" %}

## References
* Mozilla Developer Network: [JavaScript Regular Expressions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions).
{% cwe-references %}
