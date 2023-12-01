If sensitive data is written to a log entry it could be exposed to an attacker who gains access to the logs.

Potential attackers can obtain sensitive user data when the log output is displayed. Additionally that data may expose system information such as full path names, system information, and sometimes usernames and passwords.


## Recommendation
Sensitive data should not be logged.


## Example
In the example the entire process environment is logged using \`console.info\`. Regular users of the production deployed application should not have access to this much information about the environment configuration.

{% sample src="examples/CleartextLogging.js" %}
In the second example the data that is logged is not sensitive.

{% sample src="examples/CleartextLoggingGood.js" %}

## References
* OWASP: [Insertion of Sensitive Information into Log File](https://owasp.org/Top10/A09_2021-Security_Logging_and_Monitoring_Failures/).
{% cwe-references %}
