This query detects enumerations that include various commands that were also used in the Solorigate implant.

By themselves, the names of these enumeration constants are not malicious, so the query only detects enumerations that includes at least 10 of the 18 Solorigate commands.

{% render "Solorigate.inc.qhelp.md" %}

