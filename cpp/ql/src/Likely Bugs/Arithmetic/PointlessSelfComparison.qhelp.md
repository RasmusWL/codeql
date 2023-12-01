The purpose of comparing a variable to itself is usually to detect either integer overflow or floating point NaN. If the comparison does neither then it is most likely a coding error.


## Recommendation
If the purpose of the cast is to detect integer overflow, then make sure that the comparison uses explicit casts and that the types are as intended.


## Example
{% sample src="PointlessSelfComparisonExample.cpp" %}
The comparison is always true, because the explicit cast to `int` has no effect. This might mean that the definition of `T` has changed since `checkOverflow` was written and that `checkOverflow` is now obsolete.

