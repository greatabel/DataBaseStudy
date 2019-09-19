import time
from termcolor import colored
import redis 

# Create a redis client
client = redis.StrictRedis(host='localhost',
                                port=6379,
                                db=0)

client.delete('hello')

for i in range(512):
    client.hset('hello', str(i), str(i))
print(client.object('encoding', 'hello'))

client.hset('hello', '512', '512')
print(client.object('encoding', 'hello'))