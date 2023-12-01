Classes that are never used at runtime are redundant and should be removed.

{% render "DeadCodeSummary.inc.qhelp.md" %}

Classes are considered dead if at runtime:

* No methods declared in the class, or a sub-type, are called.
* No fields declared in the class, or a sub-type, are read.
* The class is never constructed.
Any class which is not dead is considered to be "live". Nested classes are considered and listed separately, as a live nested class within a dead outer class can be moved to a separate file, allowing the outer class to be deleted.

A special exception is made for "namespace classes". A namespace class is used only to group static fields, methods and nested classes - it is never instantiated, has no public constructor and has no instance methods. If a class is considered to be a namespace class, then it is live if at least one of the static members of that class is live - including static nested classes.

{% render "DeadCodeDetails.inc.qhelp.md" %}


## Recommendation
Before making any changes, confirm that the class is not required by verifying that the only dependencies on the class are from other dead classes and methods. This confirmation is necessary because there may be project-specific frameworks or techniques which can introduce hidden dependencies. If this project is for a library, then consider whether the class is part of the external API, and may be used in external projects that are not included in the snapshot.

After confirming that the class is not required, remove the class. You will also need to remove any references to this class, which may, in turn, require removing other unused classes, methods and fields (see Example 1).

Nested classes within this type should be moved, either to a new top-level type, or to another type, unless they are also marked as dead, in which case they can also be removed. Alternatively, if there are some live nested classes within the dead class, the class can be retained by converting all live nested classes to static members, and removing all instance methods and fields, and all dead static members (see Example 2).

{% render "DeadCodeExtraEntryPoints.inc.qhelp.md" %}


## Example 1
In the following example, we have a number of classes, and an "entry point" in the form of a main method.

{% sample src="DeadClass.java" %}
The class `Customer` is constructed in the main method, and is therefore live. The class `Address` is constructed in `setAddress`, so we might think that it would also be live. However, `setAddress` is never called by the main method, so, assuming that this is the entire program, an `Address` is never constructed at runtime. Therefore, the `Address` class is dead and can be removed without changing the meaning of this program. To delete the `Address` class we will also need to delete the `setAddress` and `getAddress` methods, and the `address` field, otherwise the program will not compile.


## Example 2
In the next example, we have a `CustomerActions` class containing `Action`s that affect customers. For example, this could be a Java Swing application, and the `Action`s could be actions that are available in the user interface.

{% sample src="NamespaceClass.java" %}
The `CustomerActions` class has a constructor and an instance method, which are never called. Instead, actions are instantiated directly. Although this makes the nested `Action` classes live, live nested classes do not make the outer class live. Therefore, the `CustomerActions` class is marked as dead.

There are two ways to resolve the dead `CustomerActions` class:

* Move each nested static action that is used by the program to a new file, or nest it within a different class, then delete the dead `CustomerActions` class.
* Convert the `CustomerActions` class to a *namespace class*. First convert the constructor to a *suppressed constructor* by making it private, preventing the class from being instantiated, then remove the instance method `createAddCustomerAction`.
Taking the second approach, this is the final result.

{% sample src="NamespaceClass2.java" %}
{% render "DeadCodeReferences.inc.qhelp.md" %}

