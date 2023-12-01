This rule finds non-member functions with a superfluous `const` qualifier on their return type.


## Recommendation
The superfluous `const` qualifier should be removed, as it serves no purpose. If the return type contains embedded qualifiers, then care should be taken to remove only the superfluous one.


## Example
{% sample src="ReturnConstType.cpp" %}

## References
* [comp.lang.c FAQ list · Question 6.3 ](http://c-faq.com/aryptr/aryptrequiv.html)
{% cwe-references %}
