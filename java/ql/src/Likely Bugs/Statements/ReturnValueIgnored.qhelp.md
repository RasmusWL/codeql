If the result of a method call is used in most cases, any calls to that method where the result is ignored are inconsistent, and may be erroneous uses of the API. Often, the result is some kind of status indicator, and is therefore important to check.


## Recommendation
Ensure that the results of *all* calls to a particular method are used. The return value of a method that returns a status value should normally be checked before any modified data or allocated resource is used.


## Example
Line 1 of the following example shows the value returned by `get` being ignored. Line 3 shows it being assigned to `fs`.

{% sample src="ReturnValueIgnored.java" %}

## References
* CERT Secure Coding Standards: [ EXP00-J. Do not ignore values returned by methods](https://www.securecoding.cert.org/confluence/display/java/EXP00-J.+Do+not+ignore+values+returned+by+methods).
{% cwe-references %}
