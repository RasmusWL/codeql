The program performs an out-of-bounds read or write operation, which can cause program instability. In addition, attackers may take advantage of the situation, and implement techniques to use this vulnerability to execute arbitrary code.


## Recommendation
Ensure that pointer dereferences are properly guarded to ensure that they cannot be used to read or write past the end of the allocation.


## Example
The first example allocates a buffer of size `size` and creates a local variable that stores the location that is one byte past the end of the allocation. This local variable is then dereferenced, which results in an out-of-bounds write. The second example subtracts one from the `end` variable before dereferencing it. This subtraction ensures that the write correctly updates the final byte of the allocation.

{% sample src="InvalidPointerDeref.cpp" %}

## References
* CERT C Coding Standard: [ARR30-C. Do not form or use out-of-bounds pointers or array subscripts](https://wiki.sei.cmu.edu/confluence/display/c/ARR30-C.+Do+not+form+or+use+out-of-bounds+pointers+or+array+subscripts).
* OWASP: [Buffer Overflow](https://owasp.org/www-community/vulnerabilities/Buffer_Overflow).
{% cwe-references %}
