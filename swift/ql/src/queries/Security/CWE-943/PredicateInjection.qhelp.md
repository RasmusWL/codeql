Predicates represent logical conditions that can be used to check whether an object matches them. If a predicate is built from user-provided data without sufficient sanitization, an attacker may be able to change the overall meaning of the predicate.


## Recommendation
When building a predicate from untrusted data, you should either pass it to the appropriate `arguments` parameter during initialization, or as an array of substitution variables before evaluation. You should not append or concatenate it to the body of the predicate.


## Example
In the following insecure example, `NSPredicate` is built directly from data obtained from an HTTP request. This is untrusted, and can be arbitrarily set by an attacker to alter the meaning of the predicate:

{% sample src="PredicateInjectionBad.swift" %}
A better way to do this is to use the `arguments` parameter of `NSPredicate`'s initializer. This prevents attackers from altering the meaning of the predicate, even if they control the externally obtained data, as seen in the following secure example:

{% sample src="PredicateInjectionGood.swift" %}

## References
* Apple Developer Documentation: [NSPredicate](https://developer.apple.com/documentation/foundation/nspredicate)
{% cwe-references %}
