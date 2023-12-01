Static fields of type `java.text.DateFormat` or its descendants should be avoided because the class `DateFormat` is not thread-safe.


## Recommendation
Use instance fields instead and synchronize access where necessary.


## Example
In the following example, `DateFormattingThread` declares a static field `dateF` of type `DateFormat`. When instances of `DateFormattingThread` are created and run by `DateFormatThreadUnsafe`, erroneous results are output because `dateF` is shared by all instances of `DateFormattingThread`.

{% sample src="DateFormatThreadUnsafe.java" %}
In the following modification of the above example, `DateFormattingThread` declares an *instance* field `dateF` of type `DateFormat`. When instances of `DateFormattingThread` are created and run by `DateFormatThreadUnsafeFix`, correct results are output because there is a separate instance of `dateF` for each instance of `DateFormattingThread`.

{% sample src="DateFormatThreadUnsafeGood.java" %}

## References
* Java API Specification: [java.text.DateFormat synchronization](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/text/DateFormat.html#synchronization).
{% cwe-references %}
