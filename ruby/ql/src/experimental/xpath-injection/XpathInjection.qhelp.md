If an XPath expression is built using string concatenation, and the components of the concatenation include user input, it makes it very easy for a user to create a malicious XPath expression.


## Recommendation
If user input must be included in an XPath expression, either sanitize the data or use variable references to safely embed it without altering the structure of the expression.


## Example
The following example uses the `nokogiri`, `rexml` and `libxml` XML parsers to parse a string `xml`. Then the xpath query is controlled by the user and hence leads to a vulnerability.

{% sample src="examples/XPathBad.rb" %}
To guard against XPath Injection attacks, the user input should be sanitized.

{% sample src="examples/XPathGood.rb" %}

## References
* OWASP: [XPath injection](https://owasp.org/www-community/attacks/XPATH_Injection).
{% cwe-references %}
