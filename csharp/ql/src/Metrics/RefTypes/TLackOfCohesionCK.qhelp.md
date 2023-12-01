This metric calculates the lack of cohesion of a type using a method proposed by Chidamber and Kemerer in their paper *Towards a metrics suite for object oriented design*. Most well designed types will have methods that access the same fields. If methods access disjoint subsets of the classes fields it is an indication the class may have multiple responsibilities.

The Chidamber-Kemerer formula for calculating cohesion takes every pair of methods in the type and counts the ones that access common properties and ones that do not access common properties. Let the number of pairs that access common properties be `m` and the number that do not be `n`. The formula for calculating the metric is as follows:

```
LCOM = max((n - m) / 2, 0)
```
Acceptable Chidamber-Kemerer LCOM values can vary between different types as it is not normalized to account for the total number of methods in a type but generally a value over 500 is a cause for concern.


## Recommendation
A high lack of cohesion metric often indicates a class has multiple distinct responsibilities. The solution is to identify these responsibilities and to extract the associated methods and data into separate classes.


## Example
{% sample src="TLackOfCohesionCK.cs" %}
The following table shows which pairs of methods access common properties:

{% render "TLackOfCohesionCKTable.inc.qhelp.md" %}

This table shows that for this example m=2 and n=18. Consequently, this example has an LCOM of 8:

```
LCOM = max((18 - 2) / 2, 0)
LCOM = max((16 / 2, 0)
LCOM = max(8, 0)
LCOM = 8
```

## References
* Shyam Chidamber, Chris Kemerer. *Towards a metrics suite for object oriented design*. pp 13-14.
* Oege de Moor et al. *Keynote Address: .QL for Source Code Analysis*. Proceedings of the 7th IEEE International Working Conference on Source Code Analysis and Manipulation. 2007.
{% cwe-references %}
