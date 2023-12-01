Subclasses should not set attributes that are set in the superclass. Doing so may violate invariants in the superclass.


## Recommendation
If you did not intend to override the attribute value set in the superclass, then rename the subclass attribute. If you do want to be able to set a new value for the attribute of the superclass, then convert the superclass attribute to a property. Otherwise the value should be passed as a parameter to the superclass `__init__` method.


## Example
{% sample src="OverwritingAttributeInSuperClass.py" %}
