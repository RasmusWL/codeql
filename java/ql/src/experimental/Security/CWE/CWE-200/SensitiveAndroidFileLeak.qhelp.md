The Android API allows to start an activity in another mobile application and receive a result back. When starting an activity to retrieve a file from another application, missing input validation can lead to leaking of sensitive configuration file or user data because the intent could refer to paths which are accessible to the receiver application, but are intended to be application-private.


## Recommendation
When loading file data from an activity of another application, validate that the file path is not the receiver's protected directory, which is a subdirectory of the Android application directory `/data/data/`.


## Example
The following examples show a bad situation and a good situation respectively. In the bad situation, a file is loaded without path validation. In the good situation, a file is loaded with path validation.

{% sample src="LoadFileFromAppActivity.java" %}

## References
* Google: [Android: Interacting with Other Apps](https://developer.android.com/training/basics/intents).
* CVE: [CVE-2021-32695: File Sharing Flow Initiated by a Victim Leaks Sensitive Data to a Malicious App](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-32695).
{% cwe-references %}
