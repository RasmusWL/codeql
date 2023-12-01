Creating a `StringBuilder` in the body of a loop is inefficient. It is more efficient to create the `StringBuilder` before the loop and reuse the same instance for each iteration. Use the `Clear` method to reset the `StringBuilder`, which reuses its internal buffer and is more efficient. This is particularly important in performance-critical code.


## Recommendation
Create the `StringBuilder` before the loop, and call the `Clear` method within the loop to clear the internal buffer.


## Example
The following example creates a new `StringBuilder` in the body of the loop.

{% sample src="StringBuilderInLoop.cs" %}
The code has been rewritten so that the same `StringBuilder` is used for every iteration of the loop.

{% sample src="StringBuilderInLoopFix.cs" %}

## References
* MSDN: [StringBuilder](http://msdn.microsoft.com/en-us/library/system.text.stringbuilder.aspx).
{% cwe-references %}
