Using boost::asio library but specifying a deprecated hardcoded protocol.


## Recommendation
Only use modern protocols such as TLS 1.2 or TLS 1.3.


## Example
In the following example, the `sslv2` protocol is specified. This protocol is out of date and its use is not recommended.

{% sample src="UseOfDeprecatedHardcodedProtocolBad.cpp" %}
In the corrected example, the `tlsv13` protocol is used instead.

{% sample src="UseOfDeprecatedHardcodedProtocolGood.cpp" %}

## References
* [Boost.Asio documentation](https://www.boost.org/doc/libs/1_71_0/doc/html/boost_asio.html).
{% cwe-references %}
