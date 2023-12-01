When an implicit Intent is used with a method such as `startActivity`, `startService`, or `sendBroadcast`, it may be read by other applications on the device.

This means that sensitive data in these Intents may be leaked.


## Recommendation
For `sendBroadcast` methods, a receiver permission may be specified so that only applications with a certain permission may receive the Intent; or a `LocalBroadcastManager` may be used. Otherwise, ensure that Intents containing sensitive data have an explicit receiver class set.


## Example
The following example shows two ways of broadcasting Intents. In the 'BAD' case, no "receiver permission" is specified. In the 'GOOD' case, "receiver permission" or "receiver application" is specified.

{% sample src="SensitiveCommunication.java" %}

## References
* Android Developers: [Security considerations and best practices for sending and receiving broadcasts](https://developer.android.com/guide/components/broadcasts)
* SonarSource: [Broadcasting intents is security-sensitive](https://rules.sonarsource.com/java/type/Security%20Hotspot/RSPEC-5320)
* Android Developer Fundamentals: [Restricting broadcasts](https://google-developer-training.github.io/android-developer-fundamentals-course-concepts-v2/unit-3-working-in-the-background/lesson-7-background-tasks/7-3-c-broadcasts/7-3-c-broadcasts.html)
* Carnegie Mellon University: [DRD03-J. Do not broadcast sensitive information using an implicit intent](https://wiki.sei.cmu.edu/confluence/display/android/DRD03-J.+Do+not+broadcast+sensitive+information+using+an+implicit+intent)
* Android Developers: [Android LiveData Overview](https://developer.android.com/topic/libraries/architecture/livedata)
* Oversecured: [Interception of Android implicit intents](https://blog.oversecured.com/Interception-of-Android-implicit-intents/)
{% cwe-references %}
