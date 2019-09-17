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

def key_for(user_id):
    return 'account_{}'.format(user_id)

def _lock(client, key):
    '''
    redis-py 3.0 only accepts user data as bytes, strings or numbers (ints, longs and floats). 
    Attempting to specify a key or a value as any other type will raise a DataError exception.
    
    用户应确保存入的key，value必须是bytes，string或者number三种类型，
    如果有布尔类型、None类型或者其他用户自定义类型，
    必须显式转换为上述三种合法类型再存入redis，否则会报错。
    '''
    r = client.set(key, 1, nx=1, ex=5)
    # print('-'*20, r)
    return bool(r)

def _unlock(client, key):
    client.delete(key)

def lock(client, user_id):
    key = key_for(user_id)
    if key in locks.redis:
        locks.redis[key] += 1
        return True
    ok = _lock(client, key)
    if not ok:
        return False
    locks.redis[key] = 1
    return True

def unlock(client, user_id):
    key = key_for(user_id)
    if key in locks.redis:
        locks.redis[key] -= 1
        if locks.redis[key] <= 0:
            del locks.redis[key]
        return True
    return False


if __name__ == "__main__":
    client = redis.StrictRedis(host='localhost',
                                port=6379,
                                db=0)
    print('lock', lock(client, 'codehole'))
    print('lock', lock(client, 'codehole'))
    print('unlock', unlock(client, 'codehole'))
    print('unlock', unlock(client, 'codehole'))


