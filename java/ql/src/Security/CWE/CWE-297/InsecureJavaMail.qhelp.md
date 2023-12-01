JavaMail is commonly used in Java applications to send emails. There are popular third-party libraries like Apache Commons Email which are built on JavaMail and facilitate integration. Authenticated mail sessions require user credentials and mail sessions can require SSL/TLS authentication. It is a common security vulnerability that host-specific certificate data is not validated or is incorrectly validated. Failing to validate the certificate makes the SSL session susceptible to a man-in-the-middle attack.

This query checks whether the SSL certificate is validated when credentials are used and SSL is enabled in email communications.

The query has code for both plain JavaMail invocation and mailing through Apache SimpleMail to make it more comprehensive.


## Recommendation
Validate SSL certificate when sensitive information is sent in email communications.


## Example
The following two examples show two ways of configuring secure emails through JavaMail or Apache SimpleMail. In the 'BAD' case, credentials are sent in an SSL session without certificate validation. In the 'GOOD' case, the certificate is validated.

{% sample src="JavaMail.java" %}
{% sample src="SimpleMail.java" %}

## References
* Jakarta Mail: [SSL Notes](https://eclipse-ee4j.github.io/mail/docs/SSLNOTES.txt).
* Apache Commons: [Email security](https://commons.apache.org/proper/commons-email/userguide.html#Security).
* Log4j2: [Add support for specifying an SSL configuration for SmtpAppender (CVE-2020-9488)](https://issues.apache.org/jira/browse/LOG4J2-2819).
{% cwe-references %}
