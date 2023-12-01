This rule finds expressions of the form `x >= 0` where `x` is an unsigned value. This comparison is pointless as it will always yield `1`.


## Recommendation
Check the expression to see whether a different semantics was intended.


## Example
{% sample src="UnsignedGEZero.cpp" %}

## References
* [Variables. Data types.](http://www.cplusplus.com/doc/tutorial/variables/)
{% cwe-references %}
