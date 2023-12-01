The `maxRequestLength` attribute sets the limit for the input stream buffering threshold in KB. Attackers can use large requests to cause denial-of-service attacks.


## Recommendation
The recommended value is 4096 KB but you should try setting it as small as possible according to business requirements.


## Example
The following example shows the `maxRequestLength` attribute set to a high value (255 MB) in a `Web.config` file for ASP.NET:

{% sample src="Web.config.ASPNetMaxRequestLength.bad" %}
Unless such a high value is strictly needed, it is better to set the recommended value (4096 KB):

{% sample src="Web.config.ASPNetMaxRequestLength.good" %}

## References
* MSDN: [HttpRuntimeSection.MaxRequestLength Property](https://docs.microsoft.com/en-us/dotnet/api/system.web.configuration.httpruntimesection.maxrequestlength?view=netframework-4.8).
{% cwe-references %}
