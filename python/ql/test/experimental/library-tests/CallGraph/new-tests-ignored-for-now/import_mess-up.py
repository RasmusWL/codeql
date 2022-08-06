# ==============================================================================

# not sure how to reproduce, but here is the code snippets

# flask/json/__init__.py
def dumps(obj: t.Any, app: t.Optional["Flask"] = None, **kwargs: t.Any) -> str:
    ...

# flask/json/tag.py
from ..json import dumps

class TaggedJSONSerializer:
    def dumps(self, value: t.Any) -> str:
        """Tag the value and dump it to a compact JSON string."""
        return dumps(self.tag(value), separators=(",", ":"))

# ==============================================================================

# seems to be about following aliases in imports properly

# django/db/migrations/migration.py
def swappable_dependency(value):
    ...

# django/db/migrations/migration/__init__.py
from .migration import Migration, swappable_dependency  # NOQA

# django/contrib/admin/migrations/0001_initial.py
from django.db import migrations
migrations.swappable_dependency(settings.AUTH_USER_MODEL),

# ---------------- #
# second test case #
# ---------------- #

# django/contrib/postgres/fields/array.py
class ArrayField(CheckFieldDefaultMixin, Field):
    ...

# django/contrib/postgres/fields/__init__.py
from .array import *  # NOQA

# usage file file
import django.contrib.postgres.fields
django.contrib.postgres.fields.ArrayField(...)


# ==============================================================================

# httpie/compat.py
try:
    from functools import cached_property
except ImportError:
    # Can be removed once we drop Python <3.8 support.
    # Taken from `django.utils.functional.cached_property`.
    class cached_property:
        pass

# httpie/context.py
from .compat import cached_property

@cached_property
def rich_console(self):
    pass
