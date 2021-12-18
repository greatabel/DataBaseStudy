#brew install memcached
#http://stackoverflow.com/questions/28851037/pip-install-python3-memcached-fails
#http://my.oschina.net/flynewton/blog/10660

import memcache
 
mc = memcache.Client(['127.0.0.1:12000'],debug=0)
mc.set("foo","bar")
value = mc.get("foo")
print(value)
