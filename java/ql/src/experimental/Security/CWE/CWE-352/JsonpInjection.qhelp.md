The software uses external input as the function name to wrap JSON data and returns it to the client as a request response. When there is a cross-domain problem, this could lead to information leakage.


## Recommendation
Adding `Referer`/`Origin` or random `token` verification processing can effectively prevent the leakage of sensitive information.


## Example
The following examples show the bad case and the good case respectively. Bad cases, such as `bad1` to `bad7`, will cause information leakage when there are cross-domain problems. In a good case, for example, in the `good1` method and the `good2` method, When these two methods process the request, there must be a request body in the request, which does not meet the conditions of Jsonp injection.

{% sample src="JsonpInjection.java" %}

## References
* OWASPLondon20161124_JSON_Hijacking_Gareth_Heyes: [JSON hijacking](https://owasp.org/www-chapter-london/assets/slides/OWASPLondon20161124_JSON_Hijacking_Gareth_Heyes.pdf).
* Practical JSONP Injection: [ Completely controllable from the URL (GET variable) ](https://securitycafe.ro/2017/01/18/practical-jsonp-injection).
{% cwe-references %}
