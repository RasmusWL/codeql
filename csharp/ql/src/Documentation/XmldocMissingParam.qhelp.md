A public method or constructor that does not have a `<param>` tag for each parameter makes an API more difficult to understand and maintain.


## Recommendation
The documentation comment for a method or constructor should include `<param>` tags that describe each parameter.


## Example
The following example shows a good documentation comment, which clearly explains the method's parameter.

{% sample src="XmldocMethod.cs" %}

## References
* MSDN, C\# Programming Guide: [XML Documentation Comments](http://msdn.microsoft.com/en-us/library/b2s063f7.aspx), [How to: Use the XML Documentation Features](http://msdn.microsoft.com/en-us/library/z04awywx.aspx), [Recommended Tags for Documentation Comments](http://msdn.microsoft.com/en-us/library/5ast78ax.aspx).
{% cwe-references %}
