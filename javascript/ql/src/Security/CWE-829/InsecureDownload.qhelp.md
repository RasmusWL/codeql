Downloading executables or other sensitive files over an unencrypted connection can leave a server open to man-in-the-middle attacks (MITM). Such an attack can allow an attacker to insert arbitrary content into the downloaded file, and in the worst case, allow the attacker to execute arbitrary code on the vulnerable system.


## Recommendation
Use a secure transfer protocol when downloading executables or other sensitive files.


## Example
In this example, a server downloads a shell script from a remote URL using the `node-fetch` library, and then executes this shell script.

{% sample src="examples/insecure-download.js" %}
The HTTP protocol is vulnerable to MITM, and thus an attacker could potentially replace the downloaded shell script with arbitrary code, which gives the attacker complete control over the system.

The issue has been fixed in the example below by replacing the HTTP protocol with the HTTPS protocol.

{% sample src="examples/secure-download.js" %}

## References
* Wikipedia: [Man-in-the-middle attack](https://en.wikipedia.org/wiki/Man-in-the-middle_attack)
{% cwe-references %}
