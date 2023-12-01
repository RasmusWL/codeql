A pointer to a derived class may be implicitly converted to a pointer to its base type when passed as an argument to a function expecting a pointer to the base type. If pointer arithmetic or an array dereference is then used, it will be performed using the size of the base type. This can lead to reading data from unexpected fields in the derived type.


## Recommendation
Only convert pointers to single objects. If you must work with a sequence of objects that are converted to a base type, use an array of pointers rather than a pointer to an array.


## Example
{% sample src="CastArrayPointerArithmetic.cpp" %}
