Request validation is a feature in ASP.NET that protects web applications against potentially malicious content in requests, specifically against cross-site scripting attacks (XSS).


## Recommendation
Enable the directive `validateRequest` in your `web.config` file: ` <pages validateRequest="true" /> `


## Example
The following example shows the `validateRequest` flag set to `false` in a `Web.config` file for ASP.NET. This will disable validation, and leave the web application vulnerable against common XSS attacks:

{% sample src="ASPNetPagesValidateRequestBad.config" %}
If `validateRequest` is set to `true`, validation is enabled:

{% sample src="ASPNetPagesValidateRequestGood.config" %}

## References
* MSDN: [ Request Validation in ASP.NET ](https://docs.microsoft.com/en-us/previous-versions/aspnet/hh882339(v=vs.110)?redirectedfrom=MSDN).
{% cwe-references %}
