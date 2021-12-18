# -*- coding: utf-8 -*-
import redis
pool = redis.ConnectionPool(host='localhost', port=49153, db=0)
r = redis.Redis(connection_pool=pool)
result = r.set('foo', 'bar')
print(result)
#True
result=r.get('foo')
print(result)
