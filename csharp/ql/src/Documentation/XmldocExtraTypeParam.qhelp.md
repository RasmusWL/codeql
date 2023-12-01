Documentation comments for public classes and methods should use the `<typeparam>` tag to describe the available type parameters. If the comment includes any empty, incorrect or outdated parameter names then this will make the documentation more difficult to read.


## Recommendation
The documentation comment for a class or method should always use non-empty `<typeparam>` tags that match actual parameter names.


## Example
The following example shows some examples of correct and incorrect ways to document type parameters. parameter.

{% sample src="XmldocTypeParam.cs" %}

## References
* MSDN, C\# Programming Guide: [XML Documentation Comments](http://msdn.microsoft.com/en-us/library/b2s063f7.aspx), [How to: Use the XML Documentation Features](http://msdn.microsoft.com/en-us/library/z04awywx.aspx), [Recommended Tags for Documentation Comments](http://msdn.microsoft.com/en-us/library/5ast78ax.aspx).
{% cwe-references %}
