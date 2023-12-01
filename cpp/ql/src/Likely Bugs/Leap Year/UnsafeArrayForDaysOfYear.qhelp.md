{% render "LeapYear.inc.qhelp.md" %}

This query helps to detect when a developer allocates an array or other fixed-length data structure such as `std::vector` with 365 elements – one for each day of the year.

Since leap years have 366 days, there will be no allocated element on December 31st at the end of a leap year; which will lead to a buffer overflow on a leap year.


## Recommendation
When allocating memory for storing elements for each day of the year, ensure that the correct number of elements are allocated.

It is also highly recommended to compile the code with array-bounds checking enabled whenever possible.


## Example
In this example, we are allocating 365 integers, one for each day of the year. This code will fail on a leap year, when there are 366 days.

{% sample src="UnsafeArrayForDaysOfYearBad.c" %}
When using arrays, allocate the correct number of elements to match the year.

{% sample src="UnsafeArrayForDaysOfYearGood.c" %}

## References
* NASA / Goddard Space Flight Center - [Calendars](https://eclipse.gsfc.nasa.gov/SEhelp/calendars.html)
* Wikipedia - [ Leap year bug](https://en.wikipedia.org/wiki/Leap_year_bug)
* Microsoft Azure blog - [ Is your code ready for the leap year?](https://azure.microsoft.com/en-us/blog/is-your-code-ready-for-the-leap-year/)
{% cwe-references %}
