import sys
import os

sys.path.append(os.path.dirname(os.path.dirname((__file__)))) # $ unresolved_call=sys.path.append(..)
from testlib import expects

# These are defined so that we can evaluate the test code.
NONSOURCE = "not a source"
SOURCE = "source"


def is_source(x):
    return x == "source" or x == b"source" or x == 42 or x == 42.0 or x == 42j


def SINK(x):
    if is_source(x):
        print("OK")
    else:
        print("Unexpected flow", x)


def SINK_F(x):
    if is_source(x):
        print("Unexpected flow", x)
    else:
        print("OK")


# ------------------------------------------------------------------------------
# Actual tests
# ------------------------------------------------------------------------------

@expects(3) # $ unresolved_call=expects(..) unresolved_call=expects(..)(..)
def test_dict_literal():
    d = {"key": SOURCE}
    SINK(d["key"])  # $ flow="SOURCE, l:-1 -> d['key']"
    SINK(d.get("key"))  # $ flow="SOURCE, l:-2 -> d.get(..)"
    SINK(d.setdefault("key", NONSOURCE))  # $ flow="SOURCE, l:-3 -> d.setdefault(..)"


@expects(3) # $ unresolved_call=expects(..) unresolved_call=expects(..)(..)
def test_dict_update():
    d = {}
    d["key"] = SOURCE
    SINK(d["key"])  # $ flow="SOURCE, l:-1 -> d['key']"
    SINK(d.get("key"))  # $ flow="SOURCE, l:-2 -> d.get(..)"
    SINK(d.setdefault("key", NONSOURCE))  # $ flow="SOURCE, l:-3 -> d.setdefault(..)"


@expects(2) # $ unresolved_call=expects(..) unresolved_call=expects(..)(..)
def test_dict_override():
    d = {}
    d["key"] = SOURCE
    SINK(d["key"])  # $ flow="SOURCE, l:-1 -> d['key']"

    d["key"] = NONSOURCE
    SINK_F(d["key"])


def test_dict_setdefault():
    d = {}
    d.setdefault("key", SOURCE)
    SINK(d["key"])  # $ flow="SOURCE, l:-1 -> d['key']"


@expects(3) # $ unresolved_call=expects(..) unresolved_call=expects(..)(..)
def test_dict_nonstring_key():
    d = {}
    d[42] = SOURCE
    SINK(d[42])  # $ MISSING: flow
    SINK(d.get(42))  # $ MISSING: flow
    SINK(d.setdefault(42, NONSOURCE))  # $ MISSING: flow