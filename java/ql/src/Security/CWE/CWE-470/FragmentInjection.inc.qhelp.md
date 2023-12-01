When fragments are instantiated with externally provided names, this exposes any exported activity that dynamically creates and hosts the fragment to fragment injection. A malicious application could provide the name of an arbitrary fragment, even one not designed to be externally accessible, and inject it into the activity. This can bypass access controls and expose the application to unintended effects.

Fragments are reusable parts of an Android application's user interface. Even though a fragment controls its own lifecycle and layout, and handles its input events, it cannot exist on its own: it must be hosted either by an activity or another fragment. This means that, normally, a fragment will be accessible by third-party applications (that is, exported) only if its hosting activity is itself exported.


## Recommendation
In general, do not instantiate classes (including fragments) with user-provided names unless the name has been properly validated. Also, if an exported activity is extending the `PreferenceActivity` class, make sure that the `isValidFragment` method is overriden and only returns `true` when the provided `fragmentName` points to an intended fragment.


## Example
The following example shows two cases: in the first one, untrusted data is used to instantiate and add a fragment to an activity, while in the second one, a fragment is safely added with a static name.

{% sample src="FragmentInjection.java" %}
The next example shows two activities that extend `PreferenceActivity`. The first activity overrides `isValidFragment`, but it wrongly returns `true` unconditionally. The second activity correctly overrides `isValidFragment` so that it only returns `true` when `fragmentName` is a trusted fragment name.

{% sample src="FragmentInjectionInPreferenceActivity.java" %}

## References
* Google Help: [How to fix Fragment Injection vulnerability](https://support.google.com/faqs/answer/7188427?hl=en).
* IBM Security Systems: [Android collapses into Fragments](https://securityintelligence.com/wp-content/uploads/2013/12/android-collapses-into-fragments.pdf).
* Android Developers: [Fragments](https://developer.android.com/guide/fragments)
{% cwe-references %}
