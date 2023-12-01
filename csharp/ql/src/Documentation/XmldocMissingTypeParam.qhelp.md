A public method that does not have a `<typeparam>` tag for each parameter makes an API more difficult to understand and maintain.


## Recommendation
The documentation comment for a class or method should include `<typeparam>` tags that describe each type parameter.


## Example
The following example shows some examples of correct and incorrect ways to document type parameters. parameter.

{% sample src="XmldocTypeParam.cs" %}

## References
* MSDN, C\# Programming Guide: [XML Documentation Comments](http://msdn.microsoft.com/en-us/library/b2s063f7.aspx), [How to: Use the XML Documentation Features](http://msdn.microsoft.com/en-us/library/z04awywx.aspx), [Recommended Tags for Documentation Comments](http://msdn.microsoft.com/en-us/library/5ast78ax.aspx).
{% cwe-references %}
