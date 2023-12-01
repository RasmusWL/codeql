Some header files, such as those which define structures or classes, cannot be included more than once within a translation unit, as doing so would cause a redefinition error. Such headers must be guarded to prevent ill-effects from multiple inclusion. Similarly, if header files include other header files, and this inclusion graph contains a cycle, then at least one file within the cycle must contain header guards in order to break the cycle. Because of cases like these, all headers should be guarded as a matter of good practice, even if they do not strictly need to be.

Furthermore, most modern compilers contain optimizations which are triggered by header guards. If the header guard strictly conforms to the pattern that compilers expect, then inclusions of that header other than the first have absolutely no effect: the file isn't re-read from disk, nor is it re-tokenised or re-preprocessed. This can result in a noticeable, albeit minor, improvement to compilation time.


## Recommendation
Add one of the following forms of header guard to the file (where `HEADER_NAME` is a unique identifier derived from the name of the file):

1. `#ifndef HEADER_NAME` followed by `#define HEADER_NAME` at the very start of the header, and a matching `#endif` at the very end.
1. `#if !defined(HEADER_NAME)` followed by `#define HEADER_NAME` at the very start of the header, and a matching `#endif` at the very end.
1. `#pragma once` anywhere within the header.
Note that if you are updating code to match the Joint Strike Fighter Air Vehicle coding standard, then the first option is the only appropriate form.


## Example
The author of the following header tried to use header guards, but made a typo:

{% sample src="JSF35-typo-bad.cpp" %}
In scenarios like this, `MY_HAEDER_H` should be replaced by `MY_HEADER_H` (note the transposed `A` and `E`):

{% sample src="JSF35-typo-good.cpp" %}

## Example
The following header would seem to be guarded, but doesn't strictly abide to the rules:

{% sample src="JSF35-outermost-bad.cpp" %}
Although the preprocessor directives in the preceding header will prevent errors from repeated inclusion, not all compilers are intelligent enough to recognise it as being guarded. Consequently compiler optimization will be limited. To ensure that the guard is recognized by compilers, change the header so that the guard is the outermost directive:

{% sample src="JSF35-outermost-good.cpp" %}

## Example
The following header evolved over time, with different authors adding function declarations in different places:

{% sample src="JSF35-encompassing-bad.cpp" %}
Unfortunately, the result is that some declarations are before the initial `#ifndef`, some are between the `#ifndef` and the `#define`, and some are after the final `#endif`. All three of these things must be addressed to turn the file into a correctly guarded header:

{% sample src="JSF35-encompassing-good.cpp" %}

## References
* AV Rules 27 and 35, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
* [PRE06-C. Enclose header files in an inclusion guard](https://wiki.sei.cmu.edu/confluence/display/c/PRE06-C.+Enclose+header+files+in+an+include+guard)
* [Header files](http://www.learncpp.com/cpp-tutorial/19-header-files/)
* [Headers and Includes: Why and How](http://www.cplusplus.com/forum/articles/10627/)
* [The Multiple-Include Optimization](https://gcc.gnu.org/onlinedocs/cppinternals/Guard-Macros.html)
{% cwe-references %}
