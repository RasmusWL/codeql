MyBatis allows operating the database by creating XML files to construct dynamic SQL statements. If the syntax `${param}` is used in those statements, and `param` is under the user's control, attackers can exploit this to tamper with the SQL statements or execute arbitrary SQL commands.


## Recommendation
When writing MyBatis mapping statements, try to use the syntax `#{xxx}`. If the syntax `${xxx}` must be used, any parameters included in it should be sanitized to prevent SQL injection attacks.


## Example
The following sample shows several bad and good examples of MyBatis XML files usage. In `bad1`, `bad2`, `bad3`, `bad4`, and `bad5` the syntax `${xxx}` is used to build dynamic SQL statements, which causes a SQL injection vulnerability. In `good1`, the program uses the `${xxx}` syntax, but there are subtle restrictions on the data, while in `good2` the syntax `#{xxx}` is used. In both cases the SQL injection vulnerability is prevented.

{% sample src="MyBatisMapperXmlSqlInjection.xml" %}

## References
* Fortify: [SQL Injection: MyBatis Mapper](https://vulncat.fortify.com/en/detail?id=desc.config.java.sql_injection_mybatis_mapper).
{% cwe-references %}
