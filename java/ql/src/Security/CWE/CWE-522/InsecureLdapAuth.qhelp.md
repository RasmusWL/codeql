When using the Java LDAP API to perform LDAPv3-style extended operations and controls, a context with connection properties including user credentials is started. Transmission of LDAP credentials in cleartext allows remote attackers to obtain sensitive information by sniffing the network.


## Recommendation
Use the `ldaps://` protocol to send credentials through SSL or use SASL authentication.


## Example
In the following (bad) example, a `ldap://` URL is used and credentials will be sent in plaintext.

{% sample src="LdapAuthUseLdap.java" %}
In the following (good) example, a `ldaps://` URL is used so credentials will be encrypted with SSL.

{% sample src="LdapAuthUseLdaps.java" %}
In the following (good) example, a `ldap://` URL is used, but SASL authentication is enabled so that the credentials will be encrypted.

{% sample src="LdapEnableSasl.java" %}

## References
* Oracle: [LDAP and LDAPS URLs](https://docs.oracle.com/javase/jndi/tutorial/ldap/misc/url.html)
* Oracle: [Simple authentication](https://docs.oracle.com/javase/tutorial/jndi/ldap/simple.html)
{% cwe-references %}
