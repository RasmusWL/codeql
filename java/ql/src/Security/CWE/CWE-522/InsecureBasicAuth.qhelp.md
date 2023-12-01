Basic authentication only obfuscates usernames and passwords in Base64 encoding, which can be easily recognized and reversed, thus it must not be transmitted over the cleartext HTTP channel. Transmitting sensitive information without using HTTPS makes the data vulnerable to packet sniffing.


## Recommendation
Either use a more secure authentication mechanism like digest authentication or federated authentication, or use the HTTPS communication protocol.


## Example
The following example shows two ways of using basic authentication. In the 'BAD' case, the credentials are transmitted over HTTP. In the 'GOOD' case, the credentials are transmitted over HTTPS.

{% sample src="InsecureBasicAuth.java" %}

## References
* SonarSource rule: [Basic authentication should not be used](https://rules.sonarsource.com/java/tag/owasp/RSPEC-2647).
* Acunetix: [WEB VULNERABILITIES INDEX - Basic authentication over HTTP](https://www.acunetix.com/vulnerabilities/web/basic-authentication-over-http/).
{% cwe-references %}
