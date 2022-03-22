require "excon"

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
