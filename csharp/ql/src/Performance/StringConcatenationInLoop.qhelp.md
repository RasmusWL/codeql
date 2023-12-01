This rule finds code that performs string concatenation in a loop using the `+` operator. If the enclosing loop in question is executed many times, the use of the `+` operator may be inefficient.


## Recommendation
It is better to use `System.Text.StringBuilder` for efficiency.


## Example
{% sample src="StringConcatenationInLoop.cs" %}

## Fix With StringBuilder
This code performs the same function as the example except it uses `StringBuilder` so it is more efficient.

{% sample src="StringConcatenationInLoopFix.cs" %}

## References
* MSDN: [StringBuilder](http://msdn.microsoft.com/en-us/library/system.text.stringbuilder.aspx).
{% cwe-references %}
