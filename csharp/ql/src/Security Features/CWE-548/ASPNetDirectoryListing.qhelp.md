ASP.NET applications that enable directory browsing can leak sensitive information to an attacker. The precise nature of the vulnerability depends on which files are listed and accessible.


## Recommendation
If this configuration may be used in production, remove the `directoryBrowse` element from the `Web.config` file or set the value to false.


## Example
The following example shows the `directoryBrowse` `enable` attribute set to true in a `Web.config` file for ASP.NET:

{% sample src="Web.config.bad" %}
To fix this problem, the `enable` attribute should be set to `false`, or the `directoryBrowse` element should be removed completely:

{% sample src="Web.config.good" %}

## References
* MSDN: [directoryBrowse element](https://msdn.microsoft.com/en-us/library/ms691327(v=vs.90).aspx).
{% cwe-references %}
