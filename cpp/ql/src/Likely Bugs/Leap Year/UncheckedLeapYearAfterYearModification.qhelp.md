{% render "LeapYear.inc.qhelp.md" %}

When performing arithmetic operations on a variable that represents a year, it is important to consider that the resulting value may not be a valid date.

The typical example is doing simple year arithmetic (i.e. `date.year++`) without considering if the resulting value will be a valid date or not.


## Recommendation
When modifying a year field on a date structure, verify if the resulting year is a leap year.


## Example
In this example, we are adding 1 year to the current date. This may work most of the time, but on any given February 29th, the resulting value will be invalid.

{% sample src="UncheckedLeapYearAfterYearModificationBad.c" %}
To fix this bug, check the result for leap year.

{% sample src="UncheckedLeapYearAfterYearModificationGood.c" %}

## References
* NASA / Goddard Space Flight Center - [Calendars](https://eclipse.gsfc.nasa.gov/SEhelp/calendars.html)
* Wikipedia - [ Leap year bug](https://en.wikipedia.org/wiki/Leap_year_bug)
* Microsoft Azure blog - [ Is your code ready for the leap year?](https://azure.microsoft.com/en-us/blog/is-your-code-ready-for-the-leap-year/)
{% cwe-references %}
