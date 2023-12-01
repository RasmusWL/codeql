Using a named argument whose name does not correspond to a parameter of the `__init__` method of the class being instantiated, will result in a `TypeError` at runtime.


## Recommendation
Check for typos in the name of the arguments and fix those. If the name is clearly different, then this suggests a logical error. The change required to correct the error will depend on whether the wrong argument has been specified or whether the wrong class has been specified.


## Example
{% sample src="WrongNameForArgumentInClassInstantiation.py" %}

## References
* Python Glossary: [Arguments](https://docs.python.org/2/glossary.html#term-argument).
* Python Glossary: [Parameters](https://docs.python.org/glossary.html#term-parameter).
* Python Programming FAQ: [ What is the difference between arguments and parameters?](https://docs.python.org/2/faq/programming.html#faq-argument-vs-parameter).
* The Python Language Reference: [Data model: object.__init__](https://docs.python.org/3/reference/datamodel.html#object.__init__)
* The Python Tutorial: [Classes](https://docs.python.org/3/tutorial/classes.html)
{% cwe-references %}
