Cross-site scripting (XSS) attacks can occur if untrusted input is not escaped. This applies to templates as well as code. The `jinja2` templates may be vulnerable to XSS if the environment has `autoescape` set to `False`. Unfortunately, `jinja2` sets `autoescape` to `False` by default. Explicitly setting `autoescape` to `True` when creating an `Environment` object will prevent this.


## Recommendation
Avoid setting jinja2 autoescape to False. Jinja2 provides the function `select_autoescape` to make sure that the correct auto-escaping is chosen. For example, it can be used when creating an environment `Environment(autoescape=select_autoescape(['html', 'xml'])`


## Example
The following example is a minimal Flask app which shows a safe and an unsafe way to render the given name back to the page. The first view is unsafe as `first_name` is not escaped, leaving the page vulnerable to cross-site scripting attacks. The second view is safe as `first_name` is escaped, so it is not vulnerable to cross-site scripting attacks.

{% sample src="examples/jinja2.py" %}

## References
* Jinja2: [API](http://jinja.pocoo.org/docs/2.10/api/).
* Wikipedia: [Cross-site scripting](http://en.wikipedia.org/wiki/Cross-site_scripting).
* OWASP: [XSS (Cross Site Scripting) Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html).
{% cwe-references %}
