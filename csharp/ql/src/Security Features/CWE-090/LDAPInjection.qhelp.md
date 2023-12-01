If an LDAP query is built using string concatenation, and the components of the concatenation include user input, a user is likely to be able to run malicious LDAP queries.


## Recommendation
If user input must be included in an LDAP query, it should be escaped to avoid a malicious user providing special characters that change the meaning of the query. If possible, use an existing library, such as the AntiXSS library.


## Example
In the following examples, the code accepts an "organization name" and a "username" from the user, which it uses to query LDAP to access a "type" property.

The first example concatenates the unvalidated and unencoded user input directly into both the DN (Distinguished Name) and the search filter used for the LDAP query. A malicious user could provide special characters to change the meaning of these queries, and search for a completely different set of values.

The second example uses the Microsoft AntiXSS library to encode the user values before they are included in the DN and search filters. This ensures the meaning of the query cannot be changed by a malicious user.

{% sample src="LDAPInjection.cs" %}

## References
* OWASP: [LDAP Injection Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/LDAP_Injection_Prevention_Cheat_Sheet.html).
* OWASP: [Preventing LDAP Injection in Java](https://www.owasp.org/index.php/Preventing_LDAP_Injection_in_Java).
* AntiXSS doc: [LdapFilterEncode](http://www.nudoq.org/#!/Packages/AntiXSS/AntiXssLibrary/Encoder/M/LdapFilterEncode).
* AntiXSS doc: [LdapDistinguishedNameEncode](http://www.nudoq.org/#!/Packages/AntiXSS/AntiXssLibrary/Encoder/M/LdapDistinguishedNameEncode).
{% cwe-references %}
