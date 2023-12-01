Directly writing user input (for example, an HTTP request parameter) to a webpage without properly sanitizing the input first, allows for a cross-site scripting vulnerability.


## Recommendation
To guard against cross-site scripting, consider escaping the input before writing user input to the page. The standard library provides escaping functions: `html.escape()` for Python 3.2 upwards or `cgi.escape()` older versions of Python. Most frameworks also provide their own escaping functions, for example `flask.escape()`.


## Example
The following example is a minimal flask app which shows a safe and unsafe way to render the given name back to the page. The first view is unsafe as `first_name` is not escaped, leaving the page vulnerable to cross-site scripting attacks. The second view is safe as `first_name` is escaped, so it is not vulnerable to cross-site scripting attacks.

{% sample src="examples/xss.py" %}

## References
* OWASP: [XSS (Cross Site Scripting) Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html).
* Wikipedia: [Cross-site scripting](http://en.wikipedia.org/wiki/Cross-site_scripting).
* Python Library Reference: [html.escape()](https://docs.python.org/3/library/html.html#html.escape).
{% cwe-references %}
