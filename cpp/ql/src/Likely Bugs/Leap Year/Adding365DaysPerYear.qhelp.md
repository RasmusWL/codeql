{% render "LeapYear.inc.qhelp.md" %}

When performing arithmetic operations on a variable that represents a date, leap years must be taken into account. It is not safe to assume that a year is 365 days long.


## Recommendation
Determine whether the time span in question contains a leap day, then perform the calculation using the correct number of days. Alternatively, use an established library routine that already contains correct leap year logic.


## References
* NASA / Goddard Space Flight Center - [Calendars](https://eclipse.gsfc.nasa.gov/SEhelp/calendars.html)
* Wikipedia - [ Leap year bug](https://en.wikipedia.org/wiki/Leap_year_bug)
* Microsoft Azure blog - [ Is your code ready for the leap year?](https://azure.microsoft.com/en-us/blog/is-your-code-ready-for-the-leap-year/)
{% cwe-references %}
