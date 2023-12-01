This indicates that a method would have overridden another but did not because the methods were capitalized differently.


## Recommendation
Check that there was no intention to override the parent method. If there was not then rename the child method to something more descriptive.


## Example
This example program prints "parent" although the intention may have been for it to print "child".

{% sample src="ConfusingOverridesNames.cs" %}
