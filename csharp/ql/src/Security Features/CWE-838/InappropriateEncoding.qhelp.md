Using an inappropriate encoding may yield unintended results. For example, using URL encoding for HTML content may result in an incorrectly rendered web page. Using an inappropriate encoding may further pose a security risk when a remote user can control the value being encoded. For example, redirecting to an HTML encoded URL provided by a remote user can facilitate phishing attacks.


## Recommendation
Use the appropriate encoding. For example, use HTML encoding for HTML entities, URL encoding for URLs, etc. If possible, avoid writing custom encoding/escaping functionality, and use predefined functionality such as `HttpUtility.HtmlEncode()` or `SqlParameter`s instead.


## Example
The following example shows two methods where a value is encoded before being written to an HTML page. In the `Bad` method, URL encoding is incorrectly used. In the `Good` method, HTML encoding is correctly used.

{% sample src="HtmlEncode.cs" %}
The following example shows two methods where a value is encoded before being used in a URL redirect. In the `Bad` method, HTML encoding is incorrectly used. In the `Good` method, URL encoding is correctly used.

{% sample src="UrlEncode.cs" %}
The following example shows two methods where a value is used in a SQL query. In the `Bad` method, the value is insufficiently encoded by only escaping double quotes. In the `Good` method, encoding is handled by using a SQL parameter.

{% sample src="SqlEncode.cs" %}

## References
* MSDN: [HttpUtility Class](https://msdn.microsoft.com/en-us/library/system.web.httputility(v=vs.110).aspx), [HttpServerUtility Class](https://msdn.microsoft.com/en-us/library/system.web.httpserverutility(v=vs.110).aspx), [WebUtility Class](https://msdn.microsoft.com/en-us/library/system.net.webutility(v=vs.110).aspx), [How To: Protect From SQL Injection in ASP.NET](https://msdn.microsoft.com/en-us/library/ff648339.aspx).
{% cwe-references %}
