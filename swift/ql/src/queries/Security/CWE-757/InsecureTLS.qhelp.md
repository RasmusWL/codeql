TLS v1.0 and v1.1 versions are known to be vulnerable.


## Recommendation
Use `tls_protocol_version_t.TLSv12` or `tls_protocol_version_t.TLSv13` when configuring `URLSession`.


## Example
Specify a newer `tls_protocol_version_t` explicitly, or omit it completely as the OS will use secure defaults.

{% sample src="SecureTLS.swift" %}

## References
* [Apple Platform Security - TLS security](https://support.apple.com/en-gb/guide/security/sec100a75d12/web) [Preventing Insecure Network Connections](https://developer.apple.com/documentation/security/preventing_insecure_network_connections)
{% cwe-references %}
