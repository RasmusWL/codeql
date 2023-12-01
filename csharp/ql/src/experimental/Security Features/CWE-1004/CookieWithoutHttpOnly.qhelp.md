Cookies without `HttpOnly` flag are accessible to JavaScript running in the same origin. In case of Cross-Site Scripting (XSS) vulnerability the cookie can be stolen by malicious script.


## Recommendation
Protect sensitive cookies, such as related to authentication, by setting `HttpOnly` to `true` to make them not accessible to JavaScript. In ASP.NET case it is also possible to set the attribute via `<httpCookies>` element of `web.config` with the attribute `httpOnlyCookies="true"`.


## Example
In the example below `Microsoft.AspNetCore.Http.CookieOptions.HttpOnly` is set to `true`.

{% sample src="httponlyflagcore.cs" %}
In the following example `CookiePolicyOptions` are set programmatically to configure defaults.

{% sample src="cookiepolicyoptions.cs" %}
In the example below `System.Web.HttpCookie.HttpOnly` is set to `true`.

{% sample src="httponlyflag.cs" %}

## References
* [CookieOptions.HttpOnly Property,](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.http.cookieoptions.httponly)
* [Set-Cookie](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie) Header,
* [HttpCookie.HttpOnly Property,](https://msdn.microsoft.com/en-us/library/system.web.httpcookie.httponly(v=vs.110).aspx)
* [httpCookies Element,](https://msdn.microsoft.com/library/ms228262%28v=vs.100%29.aspx)
{% cwe-references %}
