If an XPath expression is built using string concatenation, and the components of the concatenation include user input, it makes it very easy for a user to create a malicious XPath expression.


## Recommendation
If user input must be included in an XPath expression, either sanitize the data or use variable references to safely embed it without altering the structure of the expression.


## Example
In the example below, the xpath query is controlled by the user and hence leads to a vulnerability.

{% sample src="xpathBad.py" %}
This can be fixed by using a parameterized query as shown below.

{% sample src="xpathGood.py" %}

## References
* OWASP XPath injection : [](https://owasp.org/www-community/attacks/XPATH_Injection)/&gt;&gt;
{% cwe-references %}
