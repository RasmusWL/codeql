This rule finds cookies with an overly broad domain. Cookies with an overly broad domain, such as ".mybank.com", can be accessed by all web applications deployed on this domain and its sub-domains. A cookie with sensitive data, but with too broad a domain, could hence be read and tampered with by a less secure and untrusted application.


## Recommendation
Precisely define the domain of the web application for which this cookie is valid.


## Example
In this example `cookie1` is accessible from online-bank.com. `cookie2` is accessible from ebanking.online-bank.com and any subdomains of ebanking.online-bank.com.

{% sample src="CookieWithOverlyBroadDomain.cs" %}
In the following example `cookie` is only accessible from ebanking.online-bank.com which is much more secure.

{% sample src="CookieWithOverlyBroadDomainFix.cs" %}

## References
* MSDN: [HttpCookie.Domain Property](http://msdn.microsoft.com/en-us/library/system.web.httpcookie.domain.aspx).
{% cwe-references %}
