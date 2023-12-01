The Android manifest file defines configuration settings for Android applications. In this file, components can be declared with intent filters which specify what the components can do and what types of intents the components can respond to. If the `android:exported` attribute is omitted from the component when an intent filter is included, then the component will be implicitly exported.

An implicitly exported component could allow for improper access to the component and its data.


## Recommendation
Explicitly set the `android:exported` attribute for every component or use permissions to limit access to the component.


## Example
In the example below, the `android:exported` attribute is omitted when an intent filter is used.

{% sample src="ExampleBad.xml" %}
A corrected version sets the `android:exported` attribute to `false`.

{% sample src="ExampleGood.xml" %}

## References
* Android Developers: [App Manifest Overview](https://developer.android.com/guide/topics/manifest/manifest-intro).
* Android Developers: [The &lt;intent-filter&gt; element](https://developer.android.com/guide/topics/manifest/intent-filter-element).
* Android Developers: [The android:exported attribute](https://developer.android.com/guide/topics/manifest/activity-element#exported).
* Android Developers: [The android:permission attribute](https://developer.android.com/guide/topics/manifest/activity-element#prmsn).
* Android Developers: [Safer component exporting](https://developer.android.com/about/versions/12/behavior-changes-12#exported).
{% cwe-references %}
