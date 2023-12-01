This metric counts the number of fields each reference type has. If a reference type has a large number of fields then it is possible it has too many responsibilities. Note that this excludes enums.


## Recommendation
If the type performs several different functions then it should be separated into different types. If the type only performs one function you may be able to group the fields into their own dedicated classes.


## Example
In this example the class has too many fields.

{% sample src="TNumberOfFields.cs" %}

## Fix
The class only performs one function: representing a person. The fields can, however, be grouped together. There is an obvious connection between the fields associated with the person's name and their address. As such these could be broken down into separate classes as shown here.

{% sample src="TNumberOfFieldsFix.cs" %}

## References
* MSDN, C\# Reference. [Fields](http://msdn.microsoft.com/en-us/library/ms173118.aspx).
{% cwe-references %}
