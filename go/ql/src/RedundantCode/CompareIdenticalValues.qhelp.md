Comparing two identical expressions typically indicates a mistake such as a missing qualifier or a misspelled variable name.


## Recommendation
Carefully inspect the comparison to determine whether it is a symptom of a bug.


## Example
In the example below, the method `Rectangle.contains` is intended to check whether a point `(x, y)` lies inside a rectangle `r` given by its origin `(r.x, r.y)`, its width `r.width`, and its height `r.height`.

{% sample src="CompareIdenticalValues.go" %}
Note, however, that on line 9 the programmer forgot to qualify `r.y`, thus ending up comparing the argument `y` against itself. The comparison should be fixed accordingly:

{% sample src="CompareIdenticalValuesGood.go" %}
