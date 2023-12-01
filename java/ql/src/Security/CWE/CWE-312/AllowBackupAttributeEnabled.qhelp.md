In the Android manifest file, you can use the `android:allowBackup` attribute of the `application` element to define whether the application will have automatic backups or not.

If your application uses any sensitive data, you should disable automatic backups to prevent attackers from extracting it.


## Recommendation
For Android applications which process sensitive data, set `android:allowBackup` to `false` in the manifest file.

Note: Since Android 6.0 (Marshmallow), automatic backups for applications are switched on by default.


## Example
In the following two (bad) examples, the `android:allowBackup` setting is enabled:

{% sample src="AllowBackupTrue.xml" %}
{% sample src="AllowBackupEmpty.xml" %}
In the following (good) example, `android:allowBackup` is set to `false`:

{% sample src="AllowBackupFalse.xml" %}

## References
* Android Documentation: [Back up user data with Auto Backup](https://developer.android.com/guide/topics/data/autobackup#EnablingAutoBackup)
* OWASP Mobile Security Testing Guide: [ Android Backups ](https://github.com/OWASP/owasp-mstg/blob/b7a93a2e5e0557cc9a12e55fc3f6675f6986bb86/Document/0x05d-Testing-Data-Storage.md#backups)
{% cwe-references %}
