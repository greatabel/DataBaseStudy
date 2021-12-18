import time
from termcolor import colored
import redis 

# Create a redis client
client = redis.StrictRedis(host='localhost',
                                port=6379,
                                db=0)
p = client.pubsub()
p.subscribe('codehole')
time.sleep(1)
print(p.get_message())

client.publish('codehole', 'java comes')
time.sleep(1)

print(p.get_message())


client.publish('codehole', 'python comes')
time.sleep(1)

print('-'*20)
print(p.get_message())
print(p.get_message())