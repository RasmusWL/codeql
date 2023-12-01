Authentication cookies where the SameSite attribute is set to "None" can potentially be used to perform Cross-Site Request Forgery (CSRF) attacks if no other CSRF protections are in place.

With SameSite set to "None", a third party website may create an authorized cross-site request that includes the cookie. Such a cross-site request can allow that website to perform actions on behalf of a user.


## Recommendation
Set the `SameSite` attribute to `Strict` on all sensitive cookies.


## Example
The following example stores an authentication token in a cookie where the `SameSite` attribute is set to `None`.

{% sample src="examples/SameSiteCookieBad.js" %}
To prevent the cookie from being included in cross-site requests, set the `SameSite` attribute to `Strict`.

{% sample src="examples/SameSiteCookieGood.js" %}

## References
* MDN Web Docs: [SameSite cookies](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie/SameSite).
* OWASP: [SameSite](https://owasp.org/www-community/SameSite).
{% cwe-references %}
