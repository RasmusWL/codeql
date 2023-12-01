This rule finds `float` variables being used as loop counter. `float` values are prone to rounding and truncation. In particular, very large and very small float values are prone to rounding errors and could lead to unexpected loop behavior.


## Recommendation
Use an integral variable instead of a float variable for the loop counter.


## Example
{% sample src="AV Rule 197.cpp" %}

## References
* AV Rule 197, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
* MISRA C++ Rule 6-5-1, *Guidelines for the use of the C++ language in critical systems*. The Motor Industry Software Reliability Associate, 2008.
* [FLP30-C. Do not use floating-point variables as loop counters](https://www.securecoding.cert.org/confluence/display/c/FLP30-C.+Do+not+use+floating-point+variables+as+loop+counters)
{% cwe-references %}
