This rule finds calls to `std::istream::operator>>` on `std::cin` without a preceding call to `cin.width`. Consuming input from `cin` without specifying the length of the input is dangerous due to the possibility of buffer overflows.


## Recommendation
Always specify the length of any input expected from `cin` by calling `cin.width` before consuming the input.


## Example
The following example shows both a dangerous and a safe way to consume input from `cin`.

{% sample src="DangerousUseOfCin.cpp" %}

## References
{% cwe-references %}
