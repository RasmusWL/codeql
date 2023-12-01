A private field where all assignments occur as part of the declaration or in a constructor in the same class can be `readonly`. Making a field `readonly` prevents unintended assignments after object initialization.


## Recommendation
Add a `readonly` modifier to the field, unless changes to the field are allowed after object initialization.


## Example
In the following example, the field `Field` is only assigned to in the constructor, but it can still be modified after object initialization.

{% sample src="MissedReadonlyOpportunityBad.cs" %}
In the revised example, the field is made `readonly`.

{% sample src="MissedReadonlyOpportunityGood.cs" %}

## References
* Microsoft: [readonly](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/readonly).
{% cwe-references %}
