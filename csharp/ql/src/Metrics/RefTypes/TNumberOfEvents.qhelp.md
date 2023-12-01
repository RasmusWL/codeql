This metric counts the number of events each reference type has. If a reference type has a large number of events then it is possible the events are too detailed or the class has too many responsibilities.


## Recommendation
Consider whether the class is responsible for more than one thing. If it is then it may be best to split the class in two. If the class only has one responsibility and it still has too many events then you should also consider whether the detail provided by the different events could instead be provided by the `EventArgs`.


## Example
In this example the class has a lot of events.

{% sample src="TNumberOfEvents.cs" %}

## Fix
One possible improvement is to provide the detail of the event in a property of the event arguments. If the event arguments are very similar for two different events then this is a key sign that using a single event might be preferable.

{% sample src="TNumberOfEventsFix.cs" %}

## References
* MSDN. C\# Programmer's Reference. [Events Tutorial](http://msdn.microsoft.com/en-us/library/aa645739(v=vs.71).aspx).
{% cwe-references %}
