import python

from Import imp, string moduleName
where
  moduleName in [
      // web frameworks we supported originally
      "bottle", "cherrypy", "falcon", "flask", "pyramid", "tg", "tornado", "twisted",
      // django is a bit more tricky, so let's limit it to these modules in future
      "django", "django.views", "django.urls", "django.http", "django.conf.urls", "django.shortcuts",
      // stdlib
      "cgi", "http.server", "BaseHTTPServer", "CGIHTTPServer", "SimpleHTTPServer",
      // new stuff for Phase 2
      "aiohttp", "aiohttp.web", "fastapi", "idna", "markupsafe", "rsa", "jmespath", "sqlalchemy", "simplejson",
      // Other ideas
      "ujson",

      // Related to new queries (external contributions)
      // NoSQL (related to https://github.com/github/codeql/pull/5612)
      "pymongo", "flask_pymongo", "flask_mongoengine", "mongoengine", "mongosanitizer",
      // LDAP (related to https://github.com/github/codeql/pull/5444)
      "ldap", "ldap3"
    ] and
  imp.getAnImportedModuleName() = moduleName and
  exists(imp.getLocation().getFile().getRelativePath())
select imp, moduleName
