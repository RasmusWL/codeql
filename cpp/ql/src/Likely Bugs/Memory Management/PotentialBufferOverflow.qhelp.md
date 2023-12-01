This rule highlights potentially overflowing calls to the functions `sprintf` and `vsprintf` with a warning. These functions allow unbounded writes to buffers, which may cause an overflow when used on untrusted data or without adequate checks on the size of the data. Function calls of this type constitute a security risk through buffer overflows.


## Recommendation
Always control the length of buffer copy and buffer write operations. Use the safer variants `snprintf` and `vsnprintf`, which include an extra buffer length argument.


## Example
{% sample src="PotentialBufferOverflow.cpp" %}
To improve the security of this example code, three changes should be made:

1. Introduce a preprocessor define for the size of the buffer.
1. Replace both calls to `sprintf` with `snprintf`, specifying the define as the maximum length to copy. This will prevent the buffer overflow.
1. Consider using the %g format specifier instead of %f.

## References
* Common Weakness Enumeration: [CWE-120: Buffer Copy without Checking Size of Input ('Classic Buffer Overflow').](http://cwe.mitre.org/data/definitions/120.html)
* CERT C Coding Standard: [STR31-C. Guarantee that storage for strings has sufficient space for character data and the null terminator](https://www.securecoding.cert.org/confluence/display/c/STR31-C.+Guarantee+that+storage+for+strings+has+sufficient+space+for+character+data+and+the+null+terminator).
* M. Howard, D. Leblanc, J. Viega, *19 Deadly Sins of Software Security: Programming Flaws and How to Fix Them*, McGraw-Hill Osborne, 2005.
{% cwe-references %}
