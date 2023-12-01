Code which relies on an IP address or domain name for authentication can be exploited by an attacker who spoofs their address.


## Recommendation
IP address verification can be a useful part of an authentication scheme, but it should not be the single factor required for authentication. Make sure that other authentication methods are also in place.


## Example
In this example (taken from [CWE-290: Authentication Bypass by Spoofing](http://cwe.mitre.org/data/definitions/290.html)), the client is authenticated by checking that its IP address is `127.0.0.1`. An attacker might be able to bypass this authentication by spoofing their IP address.

{% sample src="AuthenticationBypass.cpp" %}

## References
{% cwe-references %}
