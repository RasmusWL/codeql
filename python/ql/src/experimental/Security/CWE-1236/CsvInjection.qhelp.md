CSV Injection, also known as Formula Injection, occurs when websites embed untrusted input inside CSV files.

When a CSV format file is opened with a spreadsheet program such as Microsoft Excel or LibreOffice Calc. this software interprets entries beginning with `=` as formulas, which may attempt information exfiltration or other malicious activity when automatically executed by the spreadsheet software.


## Recommendation
When generating CSV output, ensure that formula-sensitive metacharacters are effectively escaped or removed from all data before storage in the resultant CSV. Risky characters include `=`(equal), `+`(plus), `-`(minus), and `@`(at).


## Example
The following examples show the bad case and the good case respectively. In `bad1` method, the data provided by the user is directly stored in the CSV file, which may be attacked. But in the `good1` method, the program will check the data provided by the user, and process the data starting with `=`(equal), `+`(plus), `-`(minus), and `@`(at) characters safely.

{% sample src="CsvInjection.py" %}

## References
* OWASP: [CSV Injection](https://owasp.org/www-community/attacks/CSV_Injection).
{% cwe-references %}
