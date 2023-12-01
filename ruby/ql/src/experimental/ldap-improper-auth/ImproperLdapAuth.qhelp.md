If an LDAP connection uses user-supplied data as password, anonymous bind could be caused using an empty password to result in a successful authentication.


## Recommendation
Don't use user-supplied data as password while establishing an LDAP connection.


## Example
In the following Rails example, an `ActionController` class has a `ldap_handler` method to handle requests.

In the first example, the code builds a LDAP query whose authentication depends on user supplied data.

{% sample src="examples/LdapAuthenticationBad.rb" %}
In the second example, the authentication is established using a default password.

{% sample src="examples/LdapAuthenticationGood.rb" %}

## References
* MITRE: [CWE-287: Improper Authentication](https://cwe.mitre.org/data/definitions/287.html).
{% cwe-references %}
