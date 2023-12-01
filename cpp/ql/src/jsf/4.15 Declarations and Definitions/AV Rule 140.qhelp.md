{% render "../jsfNote.inc.qhelp.md" %}

This query highlights variables with the `register` storage class specifier. Modern compilers are now capable of optimal register placement, and overriding it could lead to worse performance.


## Recommendation
Remove the `register` storage class specifier.


## Example
{% sample src="AV Rule 140.cpp" %}

## References
* AV Rule 140, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
* M. Banahan, D. Brady, M. Doram. *The C Book*. Section 8.2.1.1. `http://publications.gbdirect.co.uk/c_book/`
{% cwe-references %}
