Octal literals starting with 0 are easily misread as a decimal, particularly by those programmers who do not have a C or Java background.

The new literal syntax for non-decimal numbers is more distinct and is thus less likely to be misunderstood.


## Recommendation
Use the 0oXXX form instead of the 0XXX form. Alternatively use binary or hexadecimal format if that would be clearer.


## Example
{% sample src="OldOctalLiteral.py" %}

## References
* Python Language Reference: [Integer Literals](http://docs.python.org/2/reference/lexical_analysis.html#integer-and-long-integer-literals).
* Python PEP 3127: [Integer Literal Support and Syntax](http://www.python.org/dev/peps/pep-3127/).
{% cwe-references %}
