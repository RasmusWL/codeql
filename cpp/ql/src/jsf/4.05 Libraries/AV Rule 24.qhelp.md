{% render "../jsfNote.inc.qhelp.md" %}

This query highlights calls to the standard library functions `abort, exit, getenv` and `system`. The functions `abort` and `exit` should not be called as they immediately terminate the program and will bypass all the normal error and exception handling routines in the software. This is especially important in software which is run on systems without an interactive OS, as restarting the software may require a complete reboot of the system. `getenv` and `system` will usually not work at all on systems that do not have a command processor.


## Recommendation
Do not use any of the functions mentioned above. Use the error/exception handling mechanism of the software system you are using instead of `exit` or `abort`, or write your own functions to emulate the functionality provided by running OS commands through `system` and `getenv`.


## Example
{% sample src="AV Rule 24.cpp" %}

## References
* AV Rule 24, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
{% cwe-references %}
