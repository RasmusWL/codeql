import python
import semmle.python.web.Http
import semmle.python.web.HttpRequest

HttpRequestTaintSource projectSource() { exists(result.getLocation().getFile().getRelativePath()) }

from string httpSourceQlClass
where httpSourceQlClass = projectSource().getAQlClass()
select httpSourceQlClass,
  count(HttpRequestTaintSource source |
    source = projectSource() and source.getAQlClass() = httpSourceQlClass
  ) as cnt
order by cnt desc
