Documentation comments for public methods and constructors should use the `<param>` tag to describe the available parameters. If the comment includes any empty, incorrect or outdated parameter names then this will make the documentation more difficult to read.


## Recommendation
The documentation comment for a method or constructor should always use non-empty `<param>` values that match actual parameter names.


## Example
The following example shows a documentation comment that references an out of date name `amount` in its `<param>` tag, which should be renamed to `incrementBy`.

{% sample src="XmldocExtraParam.cs" %}

## References
* MSDN, C\# Programming Guide: [XML Documentation Comments](http://msdn.microsoft.com/en-us/library/b2s063f7.aspx), [How to: Use the XML Documentation Features](http://msdn.microsoft.com/en-us/library/z04awywx.aspx), [Recommended Tags for Documentation Comments](http://msdn.microsoft.com/en-us/library/5ast78ax.aspx).
{% cwe-references %}
