The program calls a function that expects the variable argument list to be terminated with a sentinel value (typically NULL, 0 or -1). In this case, the sentinel value has been omitted as a final argument. This defect may result in incorrect behavior of the function and unintended stack memory access, leading to incorrect program results, instability, and even vulnerability to buffer overflow style attacks.


## Recommendation
Each description of a defect highlighted by this rule includes a suggested value for the terminator. Check that this value is correct, then add it to the end of the call.


## Example
{% sample src="UnterminatedVarargsCall.cpp" %}
In this example, the third call to `pushStrings` is not correctly terminated. This call should be updated to include `NULL` as the fourth and final argument to this call.


## References
{% cwe-references %}
