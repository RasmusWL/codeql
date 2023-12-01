C\# supports runtime loading of assemblies by path through the use of the `System.Reflection.Assembly` API. If an external user can influence the path used to load an assembly, then the application can potentially be tricked into loading an assembly which was not intended to be loaded, and executing arbitrary code.


## Recommendation
Avoid loading assemblies based on user provided input. If this is not possible, ensure that the path is validated before being used with `Assembly`. For example, compare the provided input against a whitelist of known safe assemblies, or confirm that the path is restricted to a single directory which only contains safe assemblies.


## Example
In this example, user input is provided describing the path to an assembly, which is loaded without validation. This is problematic because it allows the user to load any assembly installed on the system, and is particularly problematic if an attacker can upload a custom DLL elsewhere on the system.

{% sample src="AssemblyPathInjectionBad.cs" %}
In the corrected version, user input is validated against one of two options, and the assembly is only loaded if the user input matches one of those options.

{% sample src="AssemblyPathInjectionGood.cs" %}

## References
* Microsoft: [System.Reflection.Assembly](https://docs.microsoft.com/en-us/dotnet/api/system.reflection.assembly?view=netframework-4.8).
{% cwe-references %}
