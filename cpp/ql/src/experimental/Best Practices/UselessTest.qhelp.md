Comparison operations like `a==8 && a!=7` contain a useless part : the non-equal part. This rule finds tests of this kind within an `if` or a `while` statement


## Recommendation
Remove the useless comparisons


## Example
{% sample src="UselessTest.cpp" %}
