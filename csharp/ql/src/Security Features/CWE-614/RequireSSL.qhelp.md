Sensitive data that is transmitted using HTTP is vulnerable to being read by a third party. By default, web forms and cookies are sent via HTTP, not HTTPS. This setting can be changed by setting the `requireSSL` attribute to `"true"` in `Web.config`.


## Recommendation
When using web forms, ensure that `Web.config` contains a `<forms>` element with the attribute `requireSSL="true"`.

When using cookies, ensure that SSL is used, either via the `<forms>` attribute above, or the `<httpCookies>` element, with the attribute `requireSSL="true"`. It is also possible to require cookies to use SSL programmatically, by setting the property `System.Web.HttpCookie.Secure` to `true`.


## Example
The following example shows where to specify `requireSSL="true"` in a `Web.config` file.

{% sample src="Web.config" %}

## References
* MSDN: [HttpCookie.Secure Property](https://msdn.microsoft.com/en-us/library/system.web.httpcookie.secure(v=vs.110).aspx), [FormsAuthentication.RequireSSL Property](https://msdn.microsoft.com/en-us/library/system.web.security.formsauthentication.requiressl(v=vs.110).aspx), [forms Element for authentication](https://msdn.microsoft.com/en-us/library/1d3t3c61(v=vs.100).aspx), [httpCookies Element](https://msdn.microsoft.com/library/ms228262%28v=vs.100%29.aspx).
{% cwe-references %}
