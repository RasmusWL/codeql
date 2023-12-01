GORM errors are returned as a field of the return value instead of a separate return value.

It is therefore very easy to miss that an error may occur and omit error handling routines.


## Recommendation
Ensure that GORM errors are checked.


## Example
In the example below, the error from the database query is never checked:

{% sample src="GORMErrorNotChecked.go" %}
The corrected version checks and handles the error before returning.

{% sample src="GORMErrorNotCheckedGood.go" %}

## References
* [GORM Error Handling](https://gorm.io/docs/error_handling.html).
{% cwe-references %}
