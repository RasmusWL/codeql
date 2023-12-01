It is dangerous to load Dex libraries from shared world-writable storage spaces. A malicious actor can replace a dex file with a maliciously crafted file which when loaded by the app can lead to code execution.


## Recommendation
Loading a file from private storage instead of a world-writable one can prevent this issue, because the attacker cannot access files stored there.


## Example
The following example loads a Dex file from a shared world-writable location. in this case, since the \`/sdcard\` directory is on external storage, anyone can read/write to the location. bypassing all Android security policies. Hence, this is insecure.

{% sample src="InsecureDexLoadingBad.java" %}
The next example loads a Dex file stored inside the app's private storage. This is not exploitable as nobody else except the app can access the data stored there.

{% sample src="InsecureDexLoadingGood.java" %}

## References
* Android Documentation: [Data and file storage overview](https://developer.android.com/training/data-storage/).
* Android Documentation: [DexClassLoader](https://developer.android.com/reference/dalvik/system/DexClassLoader).
{% cwe-references %}
