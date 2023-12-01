Classes that implement `System.Security.Cryptography.ICryptoTransform` are not thread safe.

This problem is caused by the way these classes are implemented using Microsoft CAPI/CNG patterns.

For example, when a hash class implements this interface, there would typically be an instance-specific hash object created (for example using `BCryptCreateHash` function). This object can be called multiple times to add data to the hash (for example `BCryptHashData`). Finally, a function is called that finishes the hash and returns the data (for example `BCryptFinishHash`).

Allowing the same hash object to be called with data from multiple threads before calling the finish function could potentially lead to incorrect results.

For example, if you have multiple threads hashing `"abc"` on a static hash object, you may occasionally obtain the results (incorrectly) for hashing `"abcabc"`, or face other unexpected behavior.

It is very unlikely somebody outside Microsoft would write a class that implements `ICryptoTransform`, and even if they do, it is likely that they will follow the same common pattern as the existing classes implementing this interface.

Any object that implements `System.Security.Cryptography.ICryptoTransform` should not be used in concurrent threads as the instance members of such object are also not thread safe.

Potential problems may not be evident at first, but can range from explicit errors such as exceptions, to incorrect results when sharing an instance of such an object in multiple threads.

