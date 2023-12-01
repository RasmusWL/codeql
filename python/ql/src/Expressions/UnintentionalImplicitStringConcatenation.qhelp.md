When two string literals abut each other the Python interpreter implicitly concatenates them into a single string. On occasion this can be useful, but is more commonly misleading or incorrect.


## Recommendation
If the concatenation is deliberate, then use `+` to join the strings. This has no runtime overhead, and makes the intention clear.


## Example
In the first function below, `unclear`, implicit string concatenation is used twice; once deliberately and once by accident. In the second function, `clarified`, the first concatenation is made explicit and the second is removed.

{% sample src="UnintentionalImplicitStringConcatenation.py" %}

## References
* Python language reference: [String literal concatenation](https://docs.python.org/3/reference/lexical_analysis.html#string-literal-concatenation).
{% cwe-references %}
