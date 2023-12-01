Code that queries the contents of a collection (such as `ContainsKey` or `Count`) is invoked on an object that is known to be empty. Such queries do not return interesting results, and may indicate missing code or a logic error.


## Recommendation
Either remove the collection if it is unnecessary, or ensure that it contains the correct data.


## Example
The following example code is supposed to return the name of the day, but does not work because the collection `daysOfWeek` is never populated. When this code is run, an `ArgumentOutOfRangeException` exception is thrown.

{% sample src="ReadOnlyContainer.cs" %}
This problem is fixed by populating the variable `daysOfWeek` with the correct data.

{% sample src="ReadOnlyContainerFix.cs" %}
