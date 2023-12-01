When a library function dynamically constructs code in a potentially unsafe way, it's important to document to clients of the library that the function should only be used with trusted inputs. If the function is not documented as being potentially unsafe, then a client may incorrectly use inputs containing unsafe code fragments, and thereby leave the client vulnerable to code-injection attacks.


## Recommendation
Properly document library functions that construct code from unsanitized inputs, or avoid constructing code in the first place.


## Example
The following example shows two methods implemented using `eval`: a simple deserialization routine and a getter method. If untrusted inputs are used with these methods, then an attacker might be able to execute arbitrary code on the system.

{% sample src="examples/UnsafeCodeConstruction.rb" %}
To avoid this problem, either properly document that the function is potentially unsafe, or use an alternative solution such as `JSON.parse` or another library that does not allow arbitrary code to be executed.

{% sample src="examples/UnsafeCodeConstructionSafe.rb" %}

## Example
As another example, consider the below code which dynamically constructs a class that has a getter method with a custom name.

{% sample src="examples/UnsafeCodeConstruction2.rb" %}
The example dynamically constructs a string which is then executed using `module_eval`. This code will break if the specified name is not a valid Ruby identifier, and if the value is controlled by an attacker, then this could lead to code-injection.

A more robust implementation, that is also immune to code-injection, can be made by using `module_eval` with a block and using `define_method` to define the getter method.

{% sample src="examples/UnsafeCodeConstruction2Safe.rb" %}

## Example
This example dynamically registers a method on another class which forwards its arguments to a target object. This approach uses `module_eval` and string interpolation to construct class variables and methods.

{% sample src="examples/UnsafeCodeConstruction3.rb" %}
A safer approach is to use `class_variable_set` and `class_variable_get` along with `define_method`. String interpolation is still used to construct the class variable name, but this is safe because `class_variable_set` is not susceptible to code-injection.

`send` is used to dynamically call the method specified by `name`. This is a more robust alternative than the previous example, because it does not allow arbitrary code to be executed, but it does still allow for any method to be called on the target object.

{% sample src="examples/UnsafeCodeConstruction3Safe.rb" %}

## References
* OWASP: [Code Injection](https://www.owasp.org/index.php/Code_Injection).
* Wikipedia: [Code Injection](https://en.wikipedia.org/wiki/Code_injection).
* Ruby documentation: [define_method](https://docs.ruby-lang.org/en/3.2/Module.html#method-i-define_method).
* Ruby documentation: [class_variable_set](https://docs.ruby-lang.org/en/3.2/Module.html#method-i-class_variable_set).
{% cwe-references %}
