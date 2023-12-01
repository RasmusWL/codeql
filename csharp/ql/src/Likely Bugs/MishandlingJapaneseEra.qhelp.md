When eras change, calling a date and time instantiation method that relies on the default era can produce an ambiguous date. In the example below, the call to the `JapaneseCalendar.ToDateTime` method that uses the default era returns different dates depending on whether or not the new era has been defined in the registry.


## Recommendation
Use specific era when creating DateTime and DateTimeOffset structs from previously stored date in Japanese calendar

Don't store dates in Japanese format

Don't use hard-coded era start date for date calculations converting dates from Japanese date format

Use `JapaneseCalendar` class for date formatting only


## Example
This example demonstrates the dangers of using current year assumptions in Japanese date conversions

{% sample src="MishandlingJapaneseEra.cs" %}

## References
* [Handling a new era in the Japanese calendar in .NET](https://devblogs.microsoft.com/dotnet/handling-a-new-era-in-the-japanese-calendar-in-net/).
* [The Japanese Calendar's Y2K Moment](https://blogs.msdn.microsoft.com/shawnste/2018/04/12/the-japanese-calendars-y2k-moment/).
* [Era Handling for the Japanese Calendar](https://docs.microsoft.com/en-us/windows/win32/intl/era-handling-for-the-japanese-calendar).
* [List of Japanese Eras (Wikipedia)](https://simple.wikipedia.org/wiki/List_of_Japanese_eras)
{% cwe-references %}
