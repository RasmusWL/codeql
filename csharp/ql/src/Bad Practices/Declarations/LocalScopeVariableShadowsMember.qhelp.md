Naming a local variable or parameter after an existing member in the same class is confusing. It could lead to accesses or assignments to the local variable that should have been to the corresponding member.


## Recommendation
For clarity, it may be better to rename the local variable to avoid shadowing.


## Example
In this example, the local variable `title` shadows the member field of the same name. This leads to a mistaken reference to `title` when assigning the `message` string. The reference should really have been to `this.title`.

{% sample src="LocalScopeVariableShadowsMemberBad.cs" %}

## Example
In the revised example, the local variable has been renamed to `boxTitle`, and the assignment to `message` is updated accordingly.

{% sample src="LocalScopeVariableShadowsMemberGood.cs" %}
