Assigning a variable to itself typically indicates a mistake such as a missing qualifier or a misspelled variable name.


## Recommendation
Carefully inspect the assignment to check for misspellings or missing qualifiers.


## Example
In the example below, the struct type `Rect` has two setter methods `setWidth` and `setHeight` that are meant to be used to update the `width` and `height` fields, respectively:

{% sample src="SelfAssignment.go" %}
Note, however, that in `setHeight` the programmer forgot to qualify the left-hand side of the assignment with the receiver variable `r`, so the method performs a useless assignment of the `width` parameter to itself and leaves the `width` field unchanged.

To fix this issue, insert a qualifier:

{% sample src="SelfAssignmentGood.go" %}

## References
* The Go Programming Language Specification: [Assignments](https://golang.org/ref/spec#Assignments).
{% cwe-references %}
