Android allows an application to install an Android Package Kit (APK) using an `Intent` with the `"application/vnd.android.package-archive"` MIME type. If the file used in the `Intent` is from a location that is not controlled by the application (for example, an SD card that is universally writable), this can result in the unintended installation of untrusted applications.


## Recommendation
You should install packages using the `PackageInstaller` class.

If you need to install from a file, you should use a `FileProvider`. Content providers can provide more specific permissions than file system permissions can.

When your application does not require package installations, do not add the `REQUEST_INSTALL_PACKAGES` permission in the manifest file.


## Example
In the following (bad) example, the package is installed from a file which may be altered by another application:

{% sample src="InstallApkWithFile.java" %}
In the following (good) example, the package is installed by using a `FileProvider`:

{% sample src="InstallApkWithFileProvider.java" %}
In the following (good) example, the package is installed using an instance of the `android.content.pm.PackageInstaller` class:

{% sample src="InstallApkWithPackageInstaller.java" %}

## References
* Android Developers: [Intent.ACTION_INSTALL_PACKAGE](https://developer.android.com/reference/android/content/Intent#ACTION_INSTALL_PACKAGE).
* Android Developers: [Manifest.permission.REQUEST_INSTALL_PACKAGES](https://developer.android.com/reference/android/Manifest.permission#REQUEST_INSTALL_PACKAGES).
* Android Developers: [PackageInstaller](https://developer.android.com/reference/android/content/pm/PackageInstaller).
* Android Developers: [FileProvider](https://developer.android.com/reference/androidx/core/content/FileProvider).
{% cwe-references %}
