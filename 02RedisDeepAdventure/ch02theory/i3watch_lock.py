import time
from termcolor import colored
import redis 

# Create a redis client
client = redis.StrictRedis(host='localhost',
                                port=6379,
                                db=0)

def key_for(user_id):
    return 'account_{}'.format(user_id)

def double_account(client, user_id):
    key = key_for(user_id)
    while  True:
        client.watch(key)
        value = int(client.get(key))
        value *= 2 #加倍
        pipe = client.pipeline(transaction=True)
        pipe.multi()
        pipe.set(key, value)
        try:
            pipe.execute()
            break
        except redis.WatchError:
            continue
    return int(client.get(key))

user_id = 'abc'
client.setnx(key_for(user_id), 5)
print(double_account(client, user_id))