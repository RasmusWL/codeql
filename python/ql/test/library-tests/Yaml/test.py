import yaml

f = yaml.safe_load(open('test.yml'))

assert f['name'] == 'Foo'

assert f['nested']['bar'] == 'Bar'

assert f['nullValue'] == None

assert f['multiline']['literal'] == 'one\ntwo\n  three\n'
assert f['multiline']['folded'] == 'one two\n  three\n'
assert f['multiline']['nothing'] == 'one two three'
