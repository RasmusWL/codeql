Setting the 'secure' flag on a cookie to `False` can cause it to be sent in cleartext. Setting the 'httponly' flag on a cookie to `False` may allow attackers access it via JavaScript. Setting the 'samesite' flag on a cookie to `'None'` will make the cookie to be sent in third-party contexts which may be attacker-controlled.


## Recommendation
Always set `secure` to `True` or add "; Secure;" to the cookie's raw value.

Always set `httponly` to `True` or add "; HttpOnly;" to the cookie's raw value.

Always set `samesite` to `Lax` or `Strict`, or add "; SameSite=Lax;", or "; Samesite=Strict;" to the cookie's raw header value.


## Example
This example shows two ways of adding a cookie to a Flask response. The first way uses `set_cookie`'s secure flag and the second adds the secure flag in the cookie's raw value.

{% sample src="InsecureCookie.py" %}

## References
* Detectify: [Cookie lack Secure flag](https://support.detectify.com/support/solutions/articles/48001048982-cookie-lack-secure-flag).
* PortSwigger: [TLS cookie without secure flag set](https://portswigger.net/kb/issues/00500200_tls-cookie-without-secure-flag-set).
{% cwe-references %}
