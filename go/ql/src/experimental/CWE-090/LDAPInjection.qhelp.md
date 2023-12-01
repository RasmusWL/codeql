If an LDAP query or DN is built using string concatenation or string formatting, and the components of the concatenation include user input without any proper sanitization, a user is likely to be able to run malicious LDAP queries.


## Recommendation
If user input must be included in an LDAP query or DN, it should be escaped to avoid a malicious user providing special characters that change the meaning of the query. In Go, user input should be escaped with `EscapeFilter`. A good practice is to escape filter characters that could change the meaning of the query (https://tools.ietf.org/search/rfc4515\#section-3).


## Example
In the following examples, the code accepts both `filter` and `attr` from the user, which it then uses to build a LDAP query and DN.

The following example uses the unsanitized user input directly in the search filter and DN for the LDAP query. A malicious user could provide special characters to change the meaning of these components, and search for a completely different set of values.

{% sample src="example/example_bad.go" %}
In the following example, the input provided by the user is sanitized before it is included in the search filter or DN. This ensures the meaning of the query cannot be changed by a malicious user.

{% sample src="example/example_good.go" %}

## References
* OWASP: [LDAP Injection Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/LDAP_Injection_Prevention_Cheat_Sheet.html).
* OWASP: [LDAP Injection](https://owasp.org/www-community/attacks/LDAP_Injection).
* Go: [LDAP Documentation](https://github.com/go-ldap/ldap).
* Wikipedia: [LDAP injection](https://en.wikipedia.org/wiki/LDAP_injection).
* BlackHat: [LDAP Injection and Blind LDAP Injection](https://www.blackhat.com/presentations/bh-europe-08/Alonso-Parada/Whitepaper/bh-eu-08-alonso-parada-WP.pdf).
* LDAP: [Understanding and Defending Against LDAP Injection Attacks](https://ldap.com/2018/05/04/understanding-and-defending-against-ldap-injection-attacks/).
{% cwe-references %}
