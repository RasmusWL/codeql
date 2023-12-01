Definitions of constants should be placed in an appropriate class where they belong logically. It is usually bad practice to define an abstract class purely to hold a number of constant definitions.


## Recommendation
This often arises when a developer attempts to put the constant definitions into scope by just extending an abstract class that defines them. While this does save a few characters by not requiring the constant names to be qualified, it is considered bad practice and constants should be referred to by qualified name if needed.


## Example
{% sample src="NoConstantsOnlyBad.cs" %}
