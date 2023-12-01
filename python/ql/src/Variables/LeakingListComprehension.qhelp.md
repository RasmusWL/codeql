In Python 2 list comprehensions are evaluated in the enclosing scope, which means that the iteration variable of a list comprehension is visible outside of the list comprehension. In Python 3 the iteration variable is no longer visible in the enclosing scope.

Code that uses the value of a list comprehension iteration variable after the list comprehension has finished will behave differently under Python 2 and Python 3.


## Recommendation
Explicitly set the variable in the outer scope to the value that it would have held when run under Python 2. Then rename the list comprehension variable for additional clarity.


## Example
In this example, `x` is initially assigned the value of 3. In Python 3, `x` will be unchanged as the list comprehension is evaluated in its own scope. In Python 2, evaluation of the list comprehension occurs in the scope of `two_or_three`, setting `x` to 2.

{% sample src="LeakingListComprehension.py" %}
The following example is the same code as above, but the list comprehension variable is renamed to ensure it does not overwrite `x`.

{% sample src="LeakingListComprehensionFixed.py" %}

## References
* Python Tutorial: [List Comprehensions](https://docs.python.org/2/tutorial/datastructures.html#list-comprehensions).
* The History of Python: [From List Comprehensions to Generator Expressions](http://python-history.blogspot.co.uk/2010/06/from-list-comprehensions-to-generator.html).
* Python Language Reference: [List displays](https://docs.python.org/2/reference/expressions.html#list-displays).
{% cwe-references %}
