This rule finds strings that are used multiple times that should possibly be constants instead. Named constants make it easier to determine the purpose of the string and make the string easy to change if it is used more than once.


## Recommendation
Consider replacing the string with a named constant.


## Example
In the example shown it would be better if the string "127.0.0.1" was made into a named constant.

{% sample src="MagicConstantsString.cs" %}

## References
* Robert C. Martin, *Clean Code - A handbook of agile software craftsmanship*, p. 295. Prentice Hall, 2008.
{% cwe-references %}
