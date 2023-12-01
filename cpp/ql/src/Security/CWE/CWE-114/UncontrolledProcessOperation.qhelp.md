The code passes user input directly to `system`, `dlopen`, `LoadLibrary` or some other process or library routine. As a result, the user can cause execution of arbitrary code.


## Recommendation
If possible, use hard-coded string literals for the command to run or library to load. Instead of passing the user input directly to the process or library function, examine the user input and then choose among hard-coded string literals.

If the applicable libraries or commands cannot be determined at compile time, then add code to verify that the user-input string is safe before using it.


## Example
{% sample src="UncontrolledProcessOperation.c" %}

## References
{% cwe-references %}
