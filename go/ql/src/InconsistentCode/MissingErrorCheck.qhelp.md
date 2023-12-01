When a function call returns two values, a pointer and a (subtype of) error, it is conventional to assume that the pointer might be nil until either the pointer or error value has been checked.

If the pointer is dereferenced without a check, an unexpected nil pointer dereference panic may occur.


## Recommendation
Ensure that the returned pointer is either directly checked against nil, or the error value is checked before using the returned pointer.


## Example
In the example below, `user` dereferences `ptr` without checking either `ptr` or `err`. This might lead to a panic.

{% sample src="MissingErrorCheck.go" %}
The corrected version of `user` checks `err` before using `ptr`.

{% sample src="MissingErrorCheckGood.go" %}

## References
* The Go Blog: [Error handling and Go](https://blog.golang.org/error-handling-and-go).
{% cwe-references %}
