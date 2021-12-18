import redis
redis = redis.Redis(host='localhost',port=49153, db=0)
redis.smembers('circle:jdoe:soccer')
redis.sadd('circle:jdoe:soccer', 'users:fred')
redis.smembers('circle:jdoe:soccer')
