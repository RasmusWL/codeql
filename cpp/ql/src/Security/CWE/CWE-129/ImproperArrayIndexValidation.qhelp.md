C and C++ do not have built-in bounds checking for array indexing expressions such as `x[i]`. If `i` is out of bounds then the program will read/write whatever data happens to be at that address. An attacker who is able to control the value of `i` might be able to read or modify data which they are not authorized to access.


## Recommendation
Always check the bounds of array indexing expressions, especially if the index value is derived from user-controlled data.


## Example
In this example, a string is read from a socket and converted to an `int`. This `int` is then used to index the `data` array. Because the index value is a user-controlled value, it could be out of bounds.

{% sample src="ImproperArrayIndexValidationBad.c" %}
Below, the problem has been fixed by adding a guard:

{% sample src="ImproperArrayIndexValidationGood.c" %}

## References
{% cwe-references %}
