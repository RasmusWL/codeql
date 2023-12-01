Cookies that are transmitted in clear text can be intercepted by an attacker. If sensitive cookies are intercepted, the attacker can read the cookie and use it to perform actions on the user's behalf.


## Recommendation
Always transmit sensitive cookies using SSL by setting the `secure` attribute on the cookie.


## Example
The following example stores an authentication token in a cookie that can be transmitted in clear text.

{% sample src="examples/ClearTextCookieBad.js" %}
To force the cookie to be transmitted using SSL, set the `secure` attribute on the cookie.

{% sample src="examples/ClearTextCookieGood.js" %}

## References
* ExpressJS: [Use cookies securely](https://expressjs.com/en/advanced/best-practice-security.html#use-cookies-securely).
* OWASP: [Set cookie flags appropriately](https://cheatsheetseries.owasp.org/cheatsheets/Nodejs_Security_Cheat_Sheet.html#set-cookie-flags-appropriately).
* Mozilla: [Set-Cookie](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie).
{% cwe-references %}
