require "excon"

# maybe I wanted to add some kind of comment giving highlighting how this test file
# works, which could take up multiple lines

url = "http://example.com/"

resp1 = Excon.get(url) # $ clientRequestUrlPart=url
resp1.body

resp2 = Excon.post(url, body: "some_data") # $ clientRequestUrlPart=url
resp2.body

resp3 = Excon.put(url, body: "some_data") # $ clientRequestUrlPart=url
resp3.body

resp4 = Excon.patch(url, body: "some_data") # $ clientRequestUrlPart=url
resp4.body

resp5 = Excon.delete(url) # $ clientRequestUrlPart=url
resp5.body

resp6 = Excon.head(url) # $ clientRequestUrlPart=url
resp6.body

resp7 = Excon.options(url) # $ clientRequestUrlPart=url
resp7.body

resp8 = Excon.trace(url) # $ clientRequestUrlPart=url
resp8.body

host = "http://example.com"
connection1 = Excon.new(host) # $ clientRequestUrlPart=host
resp9 = connection1.get(path: "/") # $ clientRequestUrlPart="/"
resp9.body

resp10 = connection1.post(path: "/foo") # $ clientRequestUrlPart="/foo"
resp10.body

connection2 = Excon::Connection.new(host) # $ clientRequestUrlPart=host
resp9 = connection2.get(path: "/") # $ clientRequestUrlPart="/"
resp9.body

resp10 = connection2.post(path: "/foo") # $ clientRequestUrlPart="/foo"
resp10.body

# You can give annotations, to highlight that you WANT a result here
Excon.not_modeled_yet(url) # $ MISSING: clientRequestUrlPart=url

# Likewise, you can highlight that something current _is_ modeled, but shouldn't be
# (note that since I didn't actually change the modeling, the output of the expectation
# test will tell us that this SPUROUS alert has been fixed)
Excon.should_not_be_modeled(url) # $ SPURIOUS: clientRequestUrlPart=url
