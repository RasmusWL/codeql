Implementations of `equals` that use `instanceof` to check the type of their argument are likely to lead to non-symmetric definitions of `equals`, if they are further overridden in subclasses that add fields and redefine `equals`. A definition of the `equals` method should be reflexive, symmetric, and transitive, and a violation of the `equals` contract may lead to unexpected behavior.


## Recommendation
Consider using one of the following options:

* Check the type of the argument using `getClass` instead of `instanceof`.
* Declare the class or the `equals` method `final`. This prevents the creation of subclasses that would otherwise violate the `equals` contract.
* Replace inheritance by composition. Instead of a class `B` extending a class `A`, class `B` can declare a field of type `A` in addition to any other fields.
The first option has the disadvantage of violating the substitution principle of object-oriented languages, which says that an instance of a subclass of `A` can be provided whenever an instance of class `A` is required.


## Example
The first option is illustrated in the following example:

{% sample src="EqualsUsesInstanceOf.java" %}
Given the definitions in the example, `p.equals(q)` returns `true` whereas `q.equals(p)` returns `false`, which violates the symmetry requirement of the `equals` contract.

Attempting to enforce symmetry by modifying the `BadPointExt.equals` method to ignore the field `s` when its parameter is an instance of type `BadPoint` results in violating the transitivity requirement of the `equals` contract.

The classes `GoodPoint` and `GoodPointExt` avoid violating the `equals` contract by using `getClass` rather than `instanceof`.


## References
* J. Bloch, *Effective Java (second edition)*, Items 8 and 16. Addison-Wesley, 2008.
* Java API Specification: [Object.equals()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#equals(java.lang.Object)).
* Java Language Specification: [Type Comparison Operator instanceof](https://docs.oracle.com/javase/specs/jls/se11/html/jls-15.html#jls-15.20.2).
* Artima Developer: [How to Write an Equality Method in Java](https://www.artima.com/lejava/articles/equality.html).
* JavaSolutions, April 2002: [Secrets of equals()](http://www.angelikalanger.com/Articles/JavaSolutions/SecretsOfEquals/Equals.html).
{% cwe-references %}
