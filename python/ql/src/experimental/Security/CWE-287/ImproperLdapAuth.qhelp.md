If an LDAP query doesn't carry any kind of authentication, anonymous binds causes an empty or None-set password to result in a successful authentication.


## Recommendation
Use a non-empty password while establishing an LDAP connection.


## Example
In the following examples, the code builds a LDAP query whose execution carries no authentication or binds anonymously.

{% sample src="examples/auth_bad_2.py" %}
{% sample src="examples/auth_bad_3.py" %}
In the third and fourth examples, the authentication is established using a password.

{% sample src="examples/auth_good_2.py" %}
{% sample src="examples/auth_good_3.py" %}

## References
* SonarSource: [RSPEC-4433](https://rules.sonarsource.com/python/type/Vulnerability/RSPEC-4433).
* Python2: [LDAP Documentation](https://www.python-ldap.org/en/python-ldap-3.3.0/reference/ldap.html).
* Python3: [LDAP Documentation](https://ldap3.readthedocs.io/en/latest/).
{% cwe-references %}
