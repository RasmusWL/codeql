Built-in C string functions such as `strcpy` require that their input string arguments are null terminated. If the input string arguments are not null terminated, these functions will read/write beyond the length of the buffer containing the string, resulting in either buffer over-read or buffer overflow, respectively.


## Recommendation
Always guard against user-controlled strings that may not be null terminated. Otherwise, an attacker may be able to supply input without null termination.


## Example
In this example, a string is read from a file using the `read` function. Because the value may be user-controlled, the string may not be null terminated, in which case the call to `strcpy` will perform a buffer overwrite on `cpy`, potentially resulting in a program crash.

{% sample src="ImproperNullTerminationTaintedBad.cpp" %}
In the revised example, the number of bytes read is recorded in the variable `count`. In addition to checking that the read succeeds (the condition `count >= 0`), a null terminator is inserted before the call to `strcpy`.

{% sample src="ImproperNullTerminationTaintedGood.cpp" %}

## References
* B. Chess and J. West, *Secure Programming with Static Analysis*, 6.2 Maintaining the Null Terminator. Addison-Wesley. 2007.
* Linux Programmer's Manual: [READ(2)](http://man7.org/linux/man-pages/man2/read.2.html), [STRCPY(3)](http://man7.org/linux/man-pages/man3/strncpy.3.html).
{% cwe-references %}
