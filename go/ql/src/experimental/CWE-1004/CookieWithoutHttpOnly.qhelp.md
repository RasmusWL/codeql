Cookies without `HttpOnly` attribute are accessible to JavaScript running in the same origin. In case of Cross-Site Scripting (XSS) vulnerability the cookie can be stolen by malicious script.


## Recommendation
Protect sensitive cookies, such as related to authentication, by setting `HttpOnly` to `true` to make them not accessible to JavaScript.


## Example
In the following example the default `HttpOnly` value is `false`.

{% sample src="CookieWithoutHttpOnlyBad.go" %}
In the example below `HttpOnly` is set to `true`.

{% sample src="CookieWithoutHttpOnlyGood.go" %}

## References
* [type Cookie,](https://golang.org/pkg/net/http/#Cookie)
* [Set-Cookie](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie) Header,
{% cwe-references %}
