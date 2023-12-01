Failing to ensure the utilization of SSL in an LDAP connection can cause the entire communication to be sent in cleartext making it easier for an attacker to intercept it.


## Recommendation
Always set `use_SSL` to `True`, call `start_tls_s()` or set a proper option flag (`ldap.OPT_X_TLS_XXXXXX`).


## Example
This example shows both good and bad ways to deal with this issue under Python 3.

The first one sets `use_SSL` to true as a keyword argument whereas the second one fails to provide a value for it, so the default one is used (`False`).

{% sample src="examples/LDAPInsecureAuth.py" %}
