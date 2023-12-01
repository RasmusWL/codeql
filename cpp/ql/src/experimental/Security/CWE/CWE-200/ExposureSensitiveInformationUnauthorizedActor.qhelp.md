When creating a file using a library function such as `fopen`, the access rights for the newly created file are not specified as part of the call. Instead these rights are determined by the system unless the programmer takes specific measures, such as calling the Posix `umask` function at some point before the call to `fopen`. For some applications, the default access rights assigned by the system are not sufficient to protect a file against access by an attacker.


## Example
The following example demonstrates erroneous and fixed methods for working with files.

{% sample src="ExposureSensitiveInformationUnauthorizedActor.cpp" %}

## References
* CERT C Coding Standard: [FIO06-C. Create files with appropriate access permissions](https://wiki.sei.cmu.edu/confluence/display/c/FIO06-C.+Create+files+with+appropriate+access+permissions).
{% cwe-references %}
