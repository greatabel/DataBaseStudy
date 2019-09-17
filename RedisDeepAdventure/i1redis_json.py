'''
https://stackoverflow.com/questions/15219858/how-to-store-a-complex-object-in-redis-using-redis-py
'''


import time
from termcolor import colored
import redis 
import json
# Create a redis client
redis_client = redis.StrictRedis(host='localhost',
                                port=6379,
                                db=0)

def main_process():
    data = {
        'foo': 'bar',
        'ans': 42
    }
    images= [
    {'type':'big', 'url':'....'},
    {'type':'big', 'url':'....'},
    {'type':'big', 'url':'....'},
    ]

    json_data = json.dumps(data)
    redis_client.set('mydata', json_data)

    unpacked_data = json.loads(redis_client.get('mydata').decode('utf-8'))
    print(unpacked_data)


if __name__ == "__main__":
    tic = time.process_time()
    
    main_process()

    toc = time.process_time()
    print("time=",toc - tic)
