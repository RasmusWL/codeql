If an LDAP connection uses user-supplied data as password, anonymous bind could be caused using an empty password to result in a successful authentication.


## Recommendation
Don't use user-supplied data as password while establishing an LDAP connection.


## Example
In the following examples, the code accepts a bind password via a HTTP request in variable ` bindPassword`. The code builds a LDAP query whose authentication depends on user supplied data.

{% sample src="examples/LdapAuthBad.go" %}
In the following examples, the code accepts a bind password via a HTTP request in variable ` bindPassword`. The function ensures that the password provided is not empty before binding.

{% sample src="examples/LdapAuthGood.go" %}

## References
* MITRE: [CWE-287: Improper Authentication](https://cwe.mitre.org/data/definitions/287.html).
{% cwe-references %}
