This rule finds comparisons using the equals (`==`) operator on floating point values. Such comparisons can yield unexpected results due to conversion or rounding errors. Pay particular attention if you are dealing with very large or very small floating point values as rounding errors will be more prominent when using such values.


## Recommendation
Floating point numbers should be considered equal if their difference is within an appropriate margin of error.


## Example
{% sample src="FloatComparison.cpp" %}

## References
* D. Goldberg, *What Every Computer Scientist Should Know About Floating-Point Arithmetic*, ACM Computing Surveys, Volume 23, Issue 1, March 1991 ([available online](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html)).
{% cwe-references %}
