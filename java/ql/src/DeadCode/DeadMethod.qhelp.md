Methods that are never called at runtime are redundant and should be removed.

{% render "DeadCodeSummary.inc.qhelp.md" %}

Methods are considered dead if at runtime they are never called, either directly, by a method call, or indirectly, through a framework or use of reflection. Any method which is not dead is considered to be "live".

The results can include methods, constructors and initializers. Initializers come in two forms, instance initializers and static initializers. For each class there will be at most one dead initializer of each type, representing all the initialization of that type in the class.

{% render "DeadCodeDetails.inc.qhelp.md" %}


## Recommendation
Before making any changes, confirm that the method is not required by verifying that the only dependencies on the method are from other dead methods. This confirmation is necessary because there may be project-specific frameworks or techniques which can introduce hidden dependencies. If this project is for a library, then consider whether the method is part of the external API, and may be used in external projects that are not included in the snapshot.

After confirming that the method is not required, remove the method. You will also need to remove any references to this method, which may, in turn, require removing other unused classes, methods and fields (see Example 1).

If the result is a static initializer, then all `static { ... }` blocks and initializers on static fields are dead within that class. In addition, the lack of static initialization implies that all static methods and fields are also dead and can be removed. These methods and fields will also be reported separately. In contrast, static nested classes may still be live, because constructing or accessing the nested static class does not trigger static initialization of the outer class.

If the result is an instance initializer, then all instance initializer `{ ... }` blocks and initializers on instance fields are dead. In addition, the lack of instance initialization implies that the class is never constructed, which means that all instance methods and fields are also dead and can be removed. These methods and fields will also be reported separately.

{% render "DeadCodeExtraEntryPoints.inc.qhelp.md" %}


## Example 1
In the following example, we have a number of methods, and an "entry point" in the form of a main method.

{% sample src="DeadMethod.java" %}
The method `liveMethod` is called from the main method, and is therefore considered live. `liveMethod` calls `otherLiveMethod`, which also makes that live.

In contrast, `deadMethod` is never called, and does not represent an entry point, so is marked as dead. Likewise, `otherDeadMethod` is only called from the `deadMethod`, so is also marked as dead.


## Example 2
In this example, we have a test class containing a number of methods.

{% sample src="DeadMethodTest.java" %}
In this case, no methods are called directly. However, the annotations on the methods indicate that this is a test class - specifically, JUnit - and that the methods will be called by the test framework when running the tests. `testCustomer` and `setUp` are therefore considered to be "live".

{% render "DeadCodeReferences.inc.qhelp.md" %}

