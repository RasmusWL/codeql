If an LDAP query is built using string concatenation, and the components of the concatenation include user input, a user is likely to be able to run malicious LDAP queries.


## Recommendation
If user input must be included in an LDAP query, it should be escaped to avoid a malicious user providing special characters that change the meaning of the query. If possible build the LDAP query using framework helper methods, for example from Spring's `LdapQueryBuilder` and `LdapNameBuilder`, instead of string concatenation. Alternatively, escape user input using an appropriate LDAP encoding method, for example: `encodeForLDAP` or `encodeForDN` from OWASP ESAPI, `LdapEncoder.filterEncode` or `LdapEncoder.nameEncode` from Spring LDAP, or `Filter.encodeValue` from UnboundID library.


## Example
In the following examples, the code accepts an "organization name" and a "username" from the user, which it uses to query LDAP.

The first example concatenates the unvalidated and unencoded user input directly into both the DN (Distinguished Name) and the search filter used for the LDAP query. A malicious user could provide special characters to change the meaning of these queries, and search for a completely different set of values. The LDAP query is executed using Java JNDI API.

The second example uses the OWASP ESAPI library to encode the user values before they are included in the DN and search filters. This ensures the meaning of the query cannot be changed by a malicious user.

{% sample src="LdapInjectionJndi.java" %}
The third example uses Spring `LdapQueryBuilder` to build an LDAP query. In addition to simplifying the building of complex search parameters, it also provides proper escaping of any unsafe characters in search filters. The DN is built using `LdapNameBuilder`, which also provides proper escaping.

{% sample src="LdapInjectionSpring.java" %}
The fourth example uses `UnboundID` classes, `Filter` and `DN`, to construct a safe filter and base DN.

{% sample src="LdapInjectionUnboundId.java" %}
The fifth example shows how to build a safe filter and DN using the Apache LDAP API.

{% sample src="LdapInjectionApache.java" %}

## References
* OWASP: [LDAP Injection Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/LDAP_Injection_Prevention_Cheat_Sheet.html).
* OWASP ESAPI: [OWASP ESAPI](https://owasp.org/www-project-enterprise-security-api/).
* Spring LdapQueryBuilder doc: [LdapQueryBuilder](https://docs.spring.io/spring-ldap/docs/current/apidocs/org/springframework/ldap/query/LdapQueryBuilder.html).
* Spring LdapNameBuilder doc: [LdapNameBuilder](https://docs.spring.io/spring-ldap/docs/current/apidocs/org/springframework/ldap/support/LdapNameBuilder.html).
* UnboundID: [Understanding and Defending Against LDAP Injection Attacks](https://ldap.com/2018/05/04/understanding-and-defending-against-ldap-injection-attacks/).
{% cwe-references %}
