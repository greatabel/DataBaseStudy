import time
from termcolor import colored
import redis 

# Create a redis client
client = redis.StrictRedis(host='localhost',
                                port=6379,
                                db=0)
p = client.pubsub()
p.subscribe('codehole')
while True:
    msg = p.get_message()
    if not msg:
        time.sleep(1)
        continue
    print(msg)