Using the TLS or SSLv23 protocol from the boost::asio library, but not disabling deprecated protocols may expose the software to known vulnerabilities or permit weak encryption algorithms to be used. Disabling the minimum-recommended protocols is also flagged.


## Recommendation
When using the TLS or SSLv23 protocol, set the `no_tlsv1` and `no_tlsv1_1` options, but do not set `no_tlsv1_2`. When using the SSLv23 protocol, also set the `no_sslv3` option.


## Example
In the following example, the `no_tlsv1_1` option has not been set. Use of TLS 1.1 is not recommended.

{% sample src="TlsSettingsMisconfigurationBad.cpp" %}
In the corrected example, the `no_tlsv1` and `no_tlsv1_1` options have both been set, ensuring the use of TLS 1.2 or later.

{% sample src="TlsSettingsMisconfigurationGood.cpp" %}

## References
* [Boost.Asio documentation](https://www.boost.org/doc/libs/1_71_0/doc/html/boost_asio.html).
{% cwe-references %}
