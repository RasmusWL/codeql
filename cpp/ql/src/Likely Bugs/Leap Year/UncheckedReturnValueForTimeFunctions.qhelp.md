{% render "LeapYear.inc.qhelp.md" %}

When using a function that transforms a date structure, and the year on the input argument for the API has been manipulated, it is important to check for the return value of the function to make sure it succeeded.

Otherwise, the function may have failed, and the output parameter may contain invalid data that can cause any number of problems on the affected system.

The following is a list of the functions that this query covers:

* `FileTimeToSystemTime`
* `SystemTimeToFileTime`
* `SystemTimeToTzSpecificLocalTime`
* `SystemTimeToTzSpecificLocalTimeEx`
* `TzSpecificLocalTimeToSystemTime`
* `TzSpecificLocalTimeToSystemTimeEx`
* `RtlLocalTimeToSystemTime`
* `RtlTimeToSecondsSince1970`
* `_mkgmtime`

## Recommendation
When calling an API that transforms a date variable that was manipulated, always check for the return value to verify that the API call succeeded.


## Example
In this example, we are adding 1 year to the current date. This may work most of the time, but on any given February 29th, the resulting value will be invalid.

{% sample src="UncheckedLeapYearAfterYearModificationBad.c" %}
To fix this bug, you must verify the return value for `SystemTimeToFileTime` and handle any potential error accordingly.

{% sample src="UncheckedLeapYearAfterYearModificationGood.c" %}

## References
* NASA / Goddard Space Flight Center - [Calendars](https://eclipse.gsfc.nasa.gov/SEhelp/calendars.html)
* Wikipedia - [ Leap year bug](https://en.wikipedia.org/wiki/Leap_year_bug)
* Microsoft Azure blog - [ Is your code ready for the leap year?](https://azure.microsoft.com/en-us/blog/is-your-code-ready-for-the-leap-year/)
{% cwe-references %}
