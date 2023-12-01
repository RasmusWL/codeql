Finding for function calls that set file permissions that may have errors in use. Incorrect arithmetic for calculating the resolution mask, using the same mask in opposite functions, using a mask that is too wide.


## Example
The following example demonstrates erroneous and fixed ways to use functions.

{% sample src="IncorrectPrivilegeAssignment.cpp" %}

## References
* CERT C Coding Standard: [FIO06-C. Create files with appropriate access permissions](https://wiki.sei.cmu.edu/confluence/display/c/FIO06-C.+Create+files+with+appropriate+access+permissions).
{% cwe-references %}
