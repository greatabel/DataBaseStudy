'''
可重入性 是指线程在持有锁的情况下再次请求加锁， 如果一个锁支持同一个线程的多次加锁
那么这个锁就是可重入的。

redis分布式锁如果需要支持可重入，需要对客户端的set方法进行包装，使用Threadlocal存储
当前持有锁的计数

'''

import redis
import threading


locks = threading.local()
locks.redis = {}