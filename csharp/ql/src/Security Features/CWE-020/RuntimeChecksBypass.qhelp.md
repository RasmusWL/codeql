Fields that are deserialized should be validated, otherwise the deserialized object could contain invalid data.

This query finds cases where a field is validated in a constructor, but not in a deserialization method. This is an indication that the deserialization method is missing a validation step.


## Recommendation
If a field needs to be validated, then ensure that validation is also performed during deserialization.


## Example
The following example has the validation of the `Age` field in the constructor but not in the deserialization method:

{% sample src="RuntimeChecksBypassBad.cs" %}
The problem is fixed by adding validation to the deserialization method as follows:

{% sample src="RuntimeChecksBypassGood.cs" %}

## References
* OWASP: [Data Validation](https://www.owasp.org/index.php/Data_Validation).
{% cwe-references %}
