Enabling directory listing in J2EE application servers introduces the vulnerability of filename and path disclosure, which could allow an attacker to read arbitrary files in the server web directory. This includes application source code and data, as well as credentials for back-end systems.

The query detects insecure configuration by validating its web configuration.


## Recommendation
Always disabling directory listing in the production environment.


## Example
The following two examples show two ways of directory listing configuration. In the 'BAD' case, it is enabled. In the 'GOOD' case, it is disabled.

{% sample src="web.xml" %}

## References
* [CWE-548: Exposure of Information Through Directory Listing](https://cwe.mitre.org/data/definitions/548.html) [Directory listing](https://portswigger.net/kb/issues/00600100_directory-listing) [Directory traversal](https://portswigger.net/web-security/file-path-traversal)
{% cwe-references %}
