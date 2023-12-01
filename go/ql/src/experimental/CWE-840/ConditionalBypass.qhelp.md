Conditional checks that compare two values that are both controlled by an untrusted user against each other are easy to bypass and should not be used in security-critical contexts.


## Recommendation
To guard against bypass, it is advisable to avoid framing a comparison where both sides are untrusted user inputs. Instead, use a configuration to store and access the values required.


## Example
The following example shows a comparison where both the sides are from attacker-controlled request headers. This should be avoided:

{% sample src="ConditionalBypassBad.go" %}
One way to remedy the problem is to test against a value stored in a configuration:

{% sample src="ConditionalBypassGood.go" %}
