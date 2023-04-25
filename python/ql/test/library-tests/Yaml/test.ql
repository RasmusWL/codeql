import python
import semmle.python.YAML

query predicate mappingLookup(YamlMapping map, string key, YamlValue val) { val = map.lookup(key) }

query predicate stringVal(YamlString val, string s) { val.getValue() = s }
