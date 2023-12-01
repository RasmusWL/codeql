Constructing URLs with the HTTP protocol can lead to unsecured connections.


## Recommendation
When you construct a URL, ensure that you use an HTTPS URL rather than an HTTP URL. Then, any connections that are made using that URL are secure SSL connections.


## Example
The following example shows two ways of opening a connection using a URL. When the connection is opened using an HTTP URL rather than an HTTPS URL, the connection is unsecured. When the connection is opened using an HTTPS URL, the connection is a secure SSL connection.

{% sample src="UseOfHttp.cpp" %}

## References
* OWASP: [Transport Layer Protection Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Transport_Layer_Protection_Cheat_Sheet.html).
* OWASP Top 10: [A08:2021 - Software and Data Integrity Failures](https://owasp.org/Top10/A08_2021-Software_and_Data_Integrity_Failures/).
{% cwe-references %}
