Catching `NullReferenceException` should not be used as an alternative to checks and assertions for preventing dereferencing a null pointer.


## Recommendation
Check if the variable is null before dereferencing it.


## Example
The following example class, `findPerson` returns null if the person is not found.

{% sample src="CatchOfNullReferenceException.cs" %}
The following example has been updated to ensure that any null return values are handled correctly.

{% sample src="CatchOfNullReferenceExceptionFix.cs" %}

## References
{% cwe-references %}
