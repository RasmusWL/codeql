Cross-Site Scripting (XSS) is categorized as one of the OWASP Top 10 Security Vulnerabilities. The `HttpOnly` flag directs compatible browsers to prevent client-side script from accessing cookies. Including the `HttpOnly` flag in the Set-Cookie HTTP response header for a sensitive cookie helps mitigate the risk associated with XSS where an attacker's script code attempts to read the contents of a cookie and exfiltrate information obtained.


## Recommendation
Use the `HttpOnly` flag when generating a cookie containing sensitive information to help mitigate the risk of client side script accessing the protected cookie.


## Example
The following example shows two ways of generating sensitive cookies. In the 'BAD' cases, the `HttpOnly` flag is not set. In the 'GOOD' cases, the `HttpOnly` flag is set.

{% sample src="SensitiveCookieNotHttpOnly.java" %}

## References
* PortSwigger: [Cookie without HttpOnly flag set](https://portswigger.net/kb/issues/00500600_cookie-without-httponly-flag-set)
* OWASP: [HttpOnly](https://owasp.org/www-community/HttpOnly)
{% cwe-references %}
