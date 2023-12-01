Incorrect closing of the connection leads to the creation of different states for the server and client, which can be exploited by an attacker.


## Example
The following example shows the incorrect and correct usage of function SSL_shutdown.

{% sample src="DangerousUseSSL_shutdown.cpp" %}

## References
* CERT Coding Standard: [EXP12-C. Do not ignore values returned by functions - SEI CERT C Coding Standard - Confluence](https://wiki.sei.cmu.edu/confluence/display/c/EXP12-C.+Do+not+ignore+values+returned+by+functions).
* Openssl.org: [SSL_shutdown - shut down a TLS/SSL connection](https://www.openssl.org/docs/man3.0/man3/SSL_shutdown.html).
{% cwe-references %}
