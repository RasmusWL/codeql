In Solorigate, the malicious code was wrapped in generic exception catch blocks that lacked any statements. This made it harder to find any suspicious runtime exceptions.

This query detects all generic exception empty catch blocks, but it is strongly suggested that the results for cs/catch-of-all-exceptions also be reviewed in the event that a malicious swallow everything exception handler was not empty

{% render "Solorigate.inc.qhelp.md" %}

