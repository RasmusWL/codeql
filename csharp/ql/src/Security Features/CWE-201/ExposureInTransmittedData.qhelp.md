Transmitting sensitive data to the user is a potential security risk. Always ensure that transmitted data is intended for the user. For example, passwords and the contents of database exceptions are generally not appropriate to send to the user, as they reveal information that could be abused or exploited.


## Recommendation
Avoid transmitting passwords or exceptions to the user. Instead, create a more user-friendly message that does not contain potentially sensitive information. Technical errors should be written to a log file.


## Example
The following example shows the user password being sent back to the user.

{% sample src="TransmittedPassword.cs" %}
The following example shows a database exception being sent to the user. Exceptions can often contain unnecessary technical or sensitive information that should not be seen by the user.

{% sample src="TransmittedException.cs" %}

## References
* OWASP: [Sensitive Data Exposure](https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure).
{% cwe-references %}
