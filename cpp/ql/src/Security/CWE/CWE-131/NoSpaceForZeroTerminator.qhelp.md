This rule identifies calls to `malloc` that call `strlen` to determine the required buffer size, but do not allocate space for the zero terminator.


## Recommendation
The expression highlighted by this rule creates a buffer that is of insufficient size to contain the data being copied. This makes the code vulnerable to buffer overflow which can result in anything from a segmentation fault to a security vulnerability (particularly if the array is on stack-allocated memory).

Increase the size of the buffer being allocated by one or replace `malloc`, `strcpy` pairs with a call to `strdup`


## Example
{% sample src="NoSpaceForZeroTerminator.c" %}

## References
* CERT C Coding Standard: [MEM35-C. Allocate sufficient memory for an object](https://www.securecoding.cert.org/confluence/display/c/MEM35-C.+Allocate+sufficient+memory+for+an+object).
{% cwe-references %}
