When using string formatting methods (such as `string.Format()`), the following should be taken into account:

1. The formatting string must be formatted correctly, otherwise the exception `System.FormatException` will be thrown.
1. All passed arguments should be used by the formatting string, otherwise such arguments will be ignored.
1. Missing arguments will result in a `System.FormatException` exception being thrown.

## Recommendation
1. Change the format string so that it is correctly formatted. Ensure that each format item adheres to the syntax: <blockquote> <p><b>{</b><i>index</i>\[<b>,</b><i>alignment</i>\]\[<b>:</b><i>formatString</i>\]<b>}</b></p> </blockquote> When literals `{` or `}` are required, replace them with `{{` and `}}`, respectively, or supply them as arguments.
1. Change the format string to use the highlighted argument, or remove the unnecessary argument.
1. Supply the correct number of arguments to the format method, or change the format string to use the correct arguments.

## Example
In this example, a format string uses both literals `{` and `}`, but the literals are not properly escaped.

{% sample src="FormatInvalidBad.cs" %}
In the revised example, the literals are properly escaped.

{% sample src="FormatInvalidGood.cs" %}

## Example
Here are three examples where the format string does not use all the arguments.

{% sample src="FormatUnusedArgumentBad.cs" %}
* On line 7, the second argument (`ex.HResult`) is not logged.
* On line 8, the first argument (`ex`) is not logged but the second argument (`ex.HResult`) is logged twice.
* On line 9, a C-style format string is used, which is incorrect, and neither argument will be logged.

## Example
Here are two examples where the call to `String.Format()` is missing arguments.

{% sample src="FormatMissingArgumentBad.cs" %}
* On line 7, the second argument (`last`) is not supplied.
* On line 8, the format items are numbered `{1}` and `{2}`, instead of `{0}` and `{1}` as they should be.
In the revised example, both arguments are supplied.

{% sample src="FormatMissingArgumentGood.cs" %}

## References
* MSDN: [String.Format Method](https://msdn.microsoft.com/en-us/library/system.string.format.aspx).
* Microsoft: [Composite Formatting](https://docs.microsoft.com/en-us/dotnet/standard/base-types/composite-formatting).
{% cwe-references %}
