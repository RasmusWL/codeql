Catching all exceptions with a generic catch clause may be overly broad. This can make errors harder to diagnose when exceptions are caught unintentionally.


## Recommendation
If possible, catch only specific exception types to avoid catching unintended exceptions.


## Example
In the following example, a division by zero is incorrectly handled by catching all exceptions.

{% sample src="CatchOfGenericException.cs" %}
In the corrected example, division by zero is correctly handled by only catching appropriate `DivideByZeroException` exceptions. Moreover, arithmetic overflow is now handled separately from division by zero by explicitly catching `OverflowException` exceptions.

{% sample src="CatchOfGenericExceptionFix.cs" %}

## References
{% cwe-references %}
