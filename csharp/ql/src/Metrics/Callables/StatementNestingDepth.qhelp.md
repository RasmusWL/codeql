This metric measures the maximum nesting depth of statements. When statements are nested too deeply in the code they become difficult to understand. This is because understanding a line that is deeply nested requires an understanding of the context of that line.


## Recommendation
The best way to address this problem is to extract more deeply nested parts of the code into their own logical methods.


## Example
This method has a nesting depth of 4.

{% sample src="StatementNestingDepth.cs" %}

## Fixed by Extraction
This code is easier to read because the part that prints every character in the string along with its character code has been extracted to a separate method.

{% sample src="StatementNestingDepthFix.cs" %}

## References
* Martin Fowler. *Refactoring*. pp. 89-95. Addison-Wesley. 1999.
* Steve McConnell - *Code Complete: A Practical Handbook of Software Construction*.
{% cwe-references %}
