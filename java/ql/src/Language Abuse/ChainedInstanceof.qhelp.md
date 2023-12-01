Long sequences of type tests are often used to dispatch control to different branches of the code based on the type of a variable, as shown in the example below. They are often used to simulate pattern-matching in languages that do not support it. Whilst this works as a dispatch method, there are a number of problems:

* They are difficult to maintain. It is easy to add a new subtype and forget to modify all of the type test sequences throughout your code.
* They introduce unwanted dependencies on concrete classes. Code cannot be written only in terms of an interface but must instead be written considering all of the different special cases.
* They can be error-prone - it is easy to test for a base type before a derived type, resulting in a failure to execute the code handling the derived type.

## Recommendation
There are a number of different possible solutions to this problem:

* **Polymorphism**. You can add a virtual method to the type hierarchy and put the segments of code to be called in the relevant override for each concrete class. This is a good solution when: (a) you can change the type hierarchy and (b) the operation being implemented is core functionality that the types should implement. If you implement this solution then you must be careful not to introduce unwanted dependencies. If the operation depends on entities that themselves depend on the type hierarchy, then you cannot move the operation to the type hierarchy without creating a dependency cycle.
* **The visitor pattern**. You can introduce a visitor interface containing a visit method for each type in the type hierarchy, and add an `accept` method to each type in the hierarchy that takes a visitor as its parameter. The `accept` method calls the visit method of the visitor on `this`. Concrete visitors then implement the interface and process each specific type as necessary. This is a good solution when: (a) you can change the type hierarchy and (b) the type hierarchy should not know about the operation being implemented (either to avoid dependency or because it is not core functionality for the types in the hierarchy). It is also useful when you want to provide multiple operations with the same structure, on the same set of types, and you want the types themselves to control the way that the operation is structured. For example, "visit this tree using an in-order walk and apply the operation to each node". The basic visitor pattern is not suitable for all situations because it is cyclically-dependent, and the infrastructure involved is comparatively heavyweight.
* **Reflection**. You can look up one of a set of overloaded methods based on the type of one of the method parameters and invoke the method manually. This results in a loss of type safety and is rather untidy, but there are times when it is the best solution. In particular, reflection is useful when you cannot change the type hierarchy, for example, because it is third-party code.

## Example
The following example demonstrates the use "Polymorphism" and "The visitor pattern". More details on reflection can be found in \[Flanagan\].

{% sample src="ChainedInstanceof.java" %}

## References
* D. Flanagan, *Java in a Nutshell: A Desktop Quick Reference*. O'Reilly Media, 1997.
* E. Gamma, R. Helm, R. Johnson, J. Vlissides, *Design patterns: elements of reusable object-oriented software*. Addison-Wesley Longman Publishing Co., Inc. Boston, MA, 1995.
{% cwe-references %}
