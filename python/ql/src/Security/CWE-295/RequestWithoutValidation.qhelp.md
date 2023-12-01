Encryption is key to the security of most, if not all, online communication. Using Transport Layer Security (TLS) can ensure that communication cannot be interrupted by an interloper. For this reason, it is unwise to disable the verification that TLS provides. Functions in the `requests` module provide verification by default, and it is only when explicitly turned off using `verify=False` that no verification occurs.


## Recommendation
Never use `verify=False` when making a request.


## Example
The example shows two unsafe calls to [semmle.com](https://semmle.com), followed by various safe alternatives.

{% sample src="examples/make_request.py" %}

## References
* Python requests documentation: [SSL Cert Verification](https://requests.readthedocs.io/en/latest/user/advanced/#ssl-cert-verification).
{% cwe-references %}
