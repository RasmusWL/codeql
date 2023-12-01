Conditional comments are only supported in Internet Explorer and should be avoided for portability.


## Recommendation
Use feature detection (as offered by major frameworks such as [jQuery](http://jquery.com)) instead.


## Example
The following code snippet uses conditional comments to detect whether it is running on Internet Explorer 9 or newer. A better alternative would be to directly check for the desired features using, for instance, jQuery's `$.support` object.

{% sample src="examples/ConditionalComments.js" %}
Note that conditional comments are no longer supported in Internet Explorer 11 Standards mode.


## References
* Internet Explorer Dev Center: [@cc_on Statement (JavaScript)](http://web.archive.org/web/20121103072038/http://msdn.microsoft.com/en-us/library/ie/8ka90k2e(v=vs.94).aspx).
{% cwe-references %}
