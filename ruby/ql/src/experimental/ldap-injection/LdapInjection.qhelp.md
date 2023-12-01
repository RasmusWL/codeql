If an LDAP query or DN is built using string concatenation or string formatting, and the components of the concatenation include user input without any proper sanitization, a user is likely to be able to run malicious LDAP queries.


## Recommendation
If user input must be included in an LDAP query or DN, it should be escaped to avoid a malicious user providing special characters that change the meaning of the query.


## Example
In the following Rails example, an `ActionController` class has a `ldap_handler` method to handle requests.

The user and dc is specified using a parameter, `user_name` and `dc` provided by the client which it then uses to build a LDAP query and DN. This value is accessible using the `params` method.

The first example uses the unsanitized user input directly in the search filter and DN for the LDAP query. A malicious user could provide special characters to change the meaning of these components, and search for a completely different set of values.

{% sample src="examples/LdapInjectionBad.rb" %}
In the second example, the input provided by the user is sanitized before it is included in the search filter or DN. This ensures the meaning of the query cannot be changed by a malicious user.

{% sample src="examples/LdapInjectionGood.rb" %}

## References
* OWASP: [LDAP Injection Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/LDAP_Injection_Prevention_Cheat_Sheet.html).
* OWASP: [LDAP Injection](https://owasp.org/www-community/attacks/LDAP_Injection).
* Wikipedia: [LDAP injection](https://en.wikipedia.org/wiki/LDAP_injection).
* BlackHat: [LDAP Injection and Blind LDAP Injection](https://www.blackhat.com/presentations/bh-europe-08/Alonso-Parada/Whitepaper/bh-eu-08-alonso-parada-WP.pdf).
* LDAP: [Understanding and Defending Against LDAP Injection Attacks](https://ldap.com/2018/05/04/understanding-and-defending-against-ldap-injection-attacks/).
{% cwe-references %}
