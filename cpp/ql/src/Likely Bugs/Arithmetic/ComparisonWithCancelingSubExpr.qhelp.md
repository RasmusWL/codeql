If a comparison contains multiple linear sub-expressions which cancel each other out, then the comparison can be simplified by removing them. This may be indicative of a coding error.


## Recommendation
Check that the redundant sub-expressions are not the result of a coding error. If not, then simplify the comparison by removing them.


## Example
{% sample src="ComparisonWithCancelingSubExprExample.cpp" %}
