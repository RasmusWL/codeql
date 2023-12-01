Sensitive information such as user passwords should not be transmitted within the query string of the requested URL. Sensitive information within URLs may be logged in various locations, including the user's browser, the web server, and any forward or reverse proxy servers between the two endpoints. URLs may also be displayed on-screen, bookmarked or emailed around by users. They may be disclosed to third parties via the Referer header when any off-site links are followed. Placing passwords into the URL therefore increases the risk that they will be captured by an attacker.


## Recommendation
Use HTTP POST to send sensitive information as part of the request body; for example, as form data.


## Example
The following example shows two ways of sending sensitive information. In the 'BAD' case, a password is transmitted using the GET method. In the 'GOOD' case, the password is transmitted using the POST method.

{% sample src="SensitiveGetQuery.java" %}

## References
* CWE: [CWE-598: Use of GET Request Method with Sensitive Query Strings](https://cwe.mitre.org/data/definitions/598.html)
* PortSwigger (Burp): [Password Submitted using GET Method](https://portswigger.net/kb/issues/00400300_password-submitted-using-get-method)
* OWASP: [Information Exposure through Query Strings in URL](https://owasp.org/www-community/vulnerabilities/Information_exposure_through_query_strings_in_url)
{% cwe-references %}
