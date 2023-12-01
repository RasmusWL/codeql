This rule finds numbers that are used multiple times that should possibly be constants instead. Named constants make it easier to determine the purpose of the number and make the number easy to change if it is used more than once.


## Recommendation
Consider replacing the number with a named constant.


## Example
In the example shown it would be better if 3.14 was made into a named constant.

{% sample src="MagicConstantsNumbers.cs" %}

## References
* Robert C. Martin, *Clean Code - A handbook of agile software craftsmanship*, p. 295. Prentice Hall, 2008.
{% cwe-references %}
