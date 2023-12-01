Built-in C string functions such as `strcat` require that their input string arguments are null terminated. If the input string arguments are not null terminated, these functions will read/write beyond the length of the buffer containing the string, resulting in either buffer over-read or buffer overflow, respectively.


## Recommendation
Review the code and consider whether the variable that holds the string should have an initializer or whether some path through the program fails to null terminate the string.


## Example
The destination variable `dest` used in the call to `strcat` does not (necessarily) contain a null terminator. Consequently, the call to `strcat` may result in a buffer overflow.

{% sample src="ImproperNullTerminationBad.cpp" %}
In the revised example, `dest` is properly null terminated before the the call to `strcat`.

{% sample src="ImproperNullTerminationGood.cpp" %}

## References
* B. Chess and J. West, *Secure Programming with Static Analysis*, 6.2 Maintaining the Null Terminator. Addison-Wesley. 2007.
* Linux Programmer's Manual: [STRCAT(3)](http://man7.org/linux/man-pages/man3/strncat.3.html).
{% cwe-references %}
