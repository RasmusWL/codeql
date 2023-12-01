Certificate pinning is the practice of only trusting a specific set of SSL certificates, rather than those that the device trusts by default. In Android applications, it is reccomended to use certificate pinning when communicating over the network, in order to minimize the risk of machine-in-the-middle attacks from a compromised CA.


## Recommendation
The easiest way to implement certificate pinning is to declare your pins in a `network-security-config` XML file. This will automatically provide certificate pinning for any network connection made by the app.

Another way to implement certificate pinning is to use the \`CertificatePinner\` class from the \`okhttp\` library.

A final way to implement certificate pinning is to use a `TrustManager`, initialized from a `KeyStore` loaded with only the necessary certificates.


## Example
In the first (bad) case below, a network call is performed with no certificate pinning implemented. The other (good) cases demonstrate the different ways to implement certificate pinning.

{% sample src="AndroidMissingCertificatePinning1.java" %}
{% sample src="AndroidMissingCertificatePinning2.xml" %}
{% sample src="AndroidMissingCertificatePinning3.java" %}

## References
* OWASP Mobile Security: [Testing Custom Certificate Stores and Certificate Pinning (MSTG-NETWORK-4)](https://mobile-security.gitbook.io/mobile-security-testing-guide/android-testing-guide/0x05g-testing-network-communication#testing-custom-certificate-stores-and-certificate-pinning-mstg-network-4).
* Android Developers: [Network security configuration](https://developer.android.com/training/articles/security-config).
* OkHttp: [CertificatePinner](https://square.github.io/okhttp/4.x/okhttp/okhttp3/-certificate-pinner/).
{% cwe-references %}
