Earlier versions of the popular OpenSSL library suffer from a buffer overflow in its "heartbeat" code. Because of the location of the problematic code, this vulnerability is often called "Heartbleed".

Software that includes a copy of OpenSSL should be sure to use a current version of the library. If it uses an older version, it will be vulnerable to any network site it connects with.


## Recommendation
Upgrade to the latest version of OpenSSL. This problem was fixed in version 1.0.1g.


## Example
The following code is present in earlier versions of OpenSSL. The `payload` variable is the number of bytes that should be copied from the request back into the response. The call to `memcpy` does this copy. The problem is that `payload` is supplied as part of the remote request, and there is no code that checks the size of it. If the caller supplies a very large value, then the `memcpy` call will copy memory that is outside the request packet.

{% sample src="OpenSslHeartbleed.c" %}

## References
* Common Vulnerabilities and Exposures: [CVE-2014-0160](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-0160).
* OpenSSL News: [OpenSSL Security Advisory \[07 Apr 2014\]](https://www.openssl.org/news/secadv_20140407.txt).
{% cwe-references %}
