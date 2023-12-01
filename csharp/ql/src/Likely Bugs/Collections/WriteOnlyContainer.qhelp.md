If the contents of a collection are never used, then it is useless and therefore unnecessary. This adds performance overhead, obscures the code, and may indicate an error in the logic.


## Recommendation
Either remove the collection if it is no longer needed, or ensure that it is used as intended.


## Example
In this example, the property `Names` returns the wrong collection (`genres`). This logic error means that the `names` collection is populated but never accessed.

{% sample src="WriteOnlyContainer.cs" %}
The code is fixed by returning the correct field for `Names`.

{% sample src="WriteOnlyContainerFix.cs" %}
