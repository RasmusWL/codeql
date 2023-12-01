This metric counts the number of properties each reference type has. If a reference type has a large number of properties then it is possible it has too many responsibilities.


## Recommendation
If the type performs several different functions then it should be separated into different types. If the type only performs one function you may be able to group the properties into their own dedicated classes.


## Example
In this example the class has too many properties.

{% sample src="TNumberOfProperties.cs" %}

## Fix
The class only performs one function: representing a person. The properties can, however, be grouped together. There is an obvious connection between the properties associated with the person's name. As such the name properties could be extracted into a separate class as shown here.

{% sample src="TNumberOfPropertiesFix.cs" %}

## References
* MSDN. C\# Programming Guide. [Properties](http://msdn.microsoft.com/en-us/library/x9fsa0sw(v=vs.80).aspx).
{% cwe-references %}
