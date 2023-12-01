Private information that is stored in an external location may be more vulnerable because that location may not be protected by the same access controls as other parts of the system.

Examples include log files, cookies and plain text storage on disk.


## Recommendation
Ensure that private information is only stored in secure data locations.


## Example
The following example shows some private data - an address - being passed to a HTTP handler. This private information is then stored in a log file. This log file on disk may be accessible to users that do not normally have access to this private data.

{% sample src="ExposureOfPrivateInformation.cs" %}

## References
{% cwe-references %}
