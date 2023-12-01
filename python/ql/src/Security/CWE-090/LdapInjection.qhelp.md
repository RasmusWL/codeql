If an LDAP query or DN is built using string concatenation or string formatting, and the components of the concatenation include user input without any proper sanitization, a user is likely to be able to run malicious LDAP queries.


## Recommendation
If user input must be included in an LDAP query or DN, it should be escaped to avoid a malicious user providing special characters that change the meaning of the query. In Python2, user input should be escaped with `ldap.dn.escape_dn_chars` or `ldap.filter.escape_filter_chars`, while in Python3, user input should be escaped with `ldap3.utils.dn.escape_rdn` or `ldap3.utils.conv.escape_filter_chars` depending on the component tainted by the user. A good practice is to escape filter characters that could change the meaning of the query (https://tools.ietf.org/search/rfc4515\#section-3).


## Example
In the following examples, the code accepts both `username` and `dc` from the user, which it then uses to build a LDAP query and DN.

The first and the second example uses the unsanitized user input directly in the search filter and DN for the LDAP query. A malicious user could provide special characters to change the meaning of these components, and search for a completely different set of values.

{% sample src="examples/example_bad1.py" %}
{% sample src="examples/example_bad2.py" %}
In the third and fourth example, the input provided by the user is sanitized before it is included in the search filter or DN. This ensures the meaning of the query cannot be changed by a malicious user.

{% sample src="examples/example_good1.py" %}
{% sample src="examples/example_good2.py" %}

## References
* OWASP: [LDAP Injection Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/LDAP_Injection_Prevention_Cheat_Sheet.html).
* OWASP: [LDAP Injection](https://owasp.org/www-community/attacks/LDAP_Injection).
* SonarSource: [RSPEC-2078](https://rules.sonarsource.com/python/RSPEC-2078).
* Python2: [LDAP Documentation](https://www.python-ldap.org/en/python-ldap-3.3.0/reference/ldap.html).
* Python3: [LDAP Documentation](https://ldap3.readthedocs.io/en/latest/).
* Wikipedia: [LDAP injection](https://en.wikipedia.org/wiki/LDAP_injection).
* BlackHat: [LDAP Injection and Blind LDAP Injection](https://www.blackhat.com/presentations/bh-europe-08/Alonso-Parada/Whitepaper/bh-eu-08-alonso-parada-WP.pdf).
* LDAP: [Understanding and Defending Against LDAP Injection Attacks](https://ldap.com/2018/05/04/understanding-and-defending-against-ldap-injection-attacks/).
{% cwe-references %}
