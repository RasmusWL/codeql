It is generally very easy to make sure you are overriding the method you intend in C\# - you use the `override` keyword and the compiler will detect any errors you make. However, it is still possible to add methods that appear to override something but do not override because they do not use the `override` keyword or are misspelt. Methods of this type are confusing to other programmers and may act unexpectedly.


## Recommendation
The appropriate solution involves carefully examining the method in question: if it should be overriding another method, change it accordingly; if not, rename or remove it to avoid further confusion.


## Example
In the following example, the `Sub` class introduces the `Foo()` method, but hides `Super.Foo()` instead of overriding it.

{% sample src="NonOverridingMethodBad.cs" %}

## Example
In the revised example, `Sub.Foo()` overrides `Super.Foo()`.

{% sample src="NonOverridingMethodGood.cs" %}

## References
* Microsoft: [override (C\# Reference)](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/override).
{% cwe-references %}
