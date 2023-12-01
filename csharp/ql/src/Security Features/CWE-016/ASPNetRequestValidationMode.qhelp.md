The `requestValidationMode` attribute in ASP.NET is used to configure built-in validation to protect applications against code injections. Downgrading or disabling this configuration is not recommended. The default value of 4.5 is the only recommended value, as previous versions only test a subset of requests.


## Recommendation
Always set `requestValidationMode` to 4.5, or leave it at its default value.


## Example
The following example shows the `requestValidationMode` attribute set to a value of 4.0, which disables some protections and ignores individual `Page` directives:

{% sample src="ASPNetRequestValidationModeBad.config" %}
Setting the value to 4.5 enables request validation for all requests:

{% sample src="ASPNetRequestValidationModeGood.config" %}

## References
* Microsoft: [HttpRuntimeSection.RequestValidationMode Property ](https://docs.microsoft.com/en-us/dotnet/api/system.web.configuration.httpruntimesection.requestvalidationmode?view=netframework-4.8).
* OWASP: [ASP.NET Request Validation](https://www.owasp.org/index.php/ASP.NET_Request_Validation).
{% cwe-references %}
