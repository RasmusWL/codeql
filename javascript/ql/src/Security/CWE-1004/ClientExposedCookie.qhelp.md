Authentication cookies stored by a server can be accessed by a client if the `httpOnly` flag is not set.

An attacker that manages a cross-site scripting (XSS) attack can read the cookie and hijack the session.


## Recommendation
Set the `httpOnly` flag on all cookies that are not needed by the client.


## Example
The following example stores an authentication token in a cookie that can be viewed by the client.

{% sample src="examples/ClientExposedCookieBad.js" %}
To force the cookie to be transmitted using SSL, set the `secure` attribute on the cookie.

{% sample src="examples/ClientExposedCookieGood.js" %}

## References
* ExpressJS: [Use cookies securely](https://expressjs.com/en/advanced/best-practice-security.html#use-cookies-securely).
* OWASP: [Set cookie flags appropriately](https://cheatsheetseries.owasp.org/cheatsheets/Nodejs_Security_Cheat_Sheet.html#set-cookie-flags-appropriately).
* Mozilla: [Set-Cookie](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie).
{% cwe-references %}
