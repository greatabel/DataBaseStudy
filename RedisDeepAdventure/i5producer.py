import time
from termcolor import colored
import redis 

# Create a redis client
client = redis.StrictRedis(host='localhost',
                                port=6379,
                                db=0)
client.publish('codehole', 'python comes')
client.publish('codehole', 'java comes')
client.publish('codehole', 'golang comes')