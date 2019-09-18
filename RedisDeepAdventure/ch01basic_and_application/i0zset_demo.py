'''

zset 有序列表，可能是Redis最有特色的数据结构

zset 可以存储粉丝列表，value值是粉丝id，score是关注时间，
可以对粉丝列表按关注时间排序

#----------------------------#
https://pythontic.com/database/redis/sorted%20set%20-%20add%20and%20remove%20elements

https://stackoverflow.com/questions/54567896/redis-py-attributeerror-int-object-has-no-attribute-items

'''

import time
from termcolor import colored
import redis 

# Create a redis client
redis_client = redis.StrictRedis(host='localhost',
                                port=6379,
                                db=0)

def main_process():
    books = "books"

    bookname = 'think in java'
    score = 9.0
    book = {bookname: score}
    redis_client.zadd(books, book)

    bookname = 'python cookbook'
    score = 9.5
    book = {bookname: score}
    redis_client.zadd(books, book)

    bookname = 'php in action'
    score = 5.0
    book = {bookname: score}
    redis_client.zadd(books, book)

    # Print all the players based on the score in ascending order
    print(colored('Contents of the Redis sorted set in ascending order:', 'red'))
    print(redis_client.zrange(books, 0, -1))

    print(colored('Contents of the Redis sorted set in descending order:', 'green'))
    print(redis_client.zrange(books, 0, -1, desc=True))

    print(colored('Contents of the Redis sorted set in descending order (with score):', 'red'))
    print(redis_client.zrange(books, 0, -1, withscores=True))

    print(colored('count of the Redis sorted set:', 'blue'))
    print(redis_client.zcard(books))
if __name__ == "__main__":
    tic = time.process_time()
    
    main_process()

    toc = time.process_time()
    print("time=",toc - tic)





