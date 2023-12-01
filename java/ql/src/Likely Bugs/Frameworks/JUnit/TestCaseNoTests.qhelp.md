A JUnit 3.8 test case class (that is, a non-abstract class that is a subtype of `junit.framework.TestCase`) should contain test methods, and each method must have the correct signature to be used by JUnit. Otherwise, the JUnit test runner will fail with an error message.


## Recommendation
Ensure that the test case class contains some test methods, and that each method is of the form:

```

public void testXXX() {
  // ...
}

```
Note that the method name must start with `test` and the method must not take any parameters.

If the test case class is intended strictly for subclassing by other test case classes, consider making it abstract to document this intention. It will then no longer be flagged by this query.

This rule applies only to JUnit 3.8-style test case classes. In JUnit 4, it is no longer required to extend `junit.framework.TestCase` to mark test methods.


## Example
In the following example, `TestCaseNoTests38` does not contain any valid JUnit test methods. However, `MyTests` contains two valid JUnit test methods.

{% sample src="TestCaseNoTests.java" %}

## References
* JUnit: [JUnit Cookbook](http://junit.sourceforge.net/junit3.8.1/doc/cookbook/cookbook.htm).
{% cwe-references %}
