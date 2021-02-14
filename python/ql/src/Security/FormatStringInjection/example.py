## User controlled format string

### information exposure

Example adapted from https://medium.com/swlh/hacking-python-applications-5d4cd541b3f1 (which in turn seems to mostly be a copy of https://lucumr.pocoo.org/2016/12/29/careful-with-str-format/)

```py
CONFIG = {
    "API_KEY": "771df488714111d39138eb60df756e6b"
    # some program secrets that users should not be able to read
}
class Person(object):
    def __init__(self, name):
        self.name = name

new_person = Person("Foo")
print("{person.__init__.__globals__[CONFIG][API_KEY]}".format(person=new_person)) # will leak API_KEY
print("{0.__init__.__globals__[CONFIG][API_KEY]}".format(new_person)) # will leak API_KEY
```

### Denial of Service

Inspired by https://stackoverflow.com/questions/15356649/can-pythons-string-format-be-made-safe-for-untrusted-format-strings

You can make the format-string take up A LOT of memory, by forcing a ridiculous amount of padding

```py
# on my system, this takes up about 8 GB of memory and a whopping 4 seconds to compute with `python -c ...`
"{:>10000000000}".format(1)
format(1, ">10000000000")
```
