A JUnit 3.8 test method that overrides a non-empty `tearDown` method should call `super.tearDown` to make sure that the superclass performs its de-initialization routines. Not calling `tearDown` may result in test failures in subsequent tests, or allow the current state to persist and affect any following tests.


## Recommendation
Call `super.tearDown` at the end of the overriding `tearDown` method.


## Example
In the following example, `TearDownNoSuper.tearDown` does not call `super.tearDown`, which may cause subsequent tests to fail, or allow the internal state to be maintained. However, `TearDownSuper.tearDown` *does* call `super.tearDown`, at the end of the method, to enable `FrameworkTestCase.tearDown` to perform de-initialization.

{% sample src="TearDownNoSuper.java" %}

## References
* JUnit: [JUnit Cookbook](http://junit.sourceforge.net/junit3.8.1/doc/cookbook/cookbook.htm).
{% cwe-references %}
