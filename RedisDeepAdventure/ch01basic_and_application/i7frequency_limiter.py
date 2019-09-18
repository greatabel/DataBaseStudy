'''
断尾求生--简单限流

'''

import redis
import time


client = redis.StrictRedis(host='localhost',
                            port=6379,
                            db=0)

def is_action_allowed(user_id, action_key, period, max_count):
    key = 'hist:%s:%s' % (user_id, action_key)
    # print('time().time()=', str(time()) )
    now_ts = int(time.time() * 1000) #毫秒时间戳
    with client.pipeline() as pipe:
        #记录行为: value 和 score都用now_ts
        v = {now_ts: now_ts}
        pipe.zadd(key, v)

        #移除时间窗口外的行为记录
        pipe.zremrangebyscore(key, 0, now_ts - period*1000)
        #获取窗口内行为数量
        pipe.zcard(key)
        #设置zset过期时间，避免冷用户持续占用内存
        # 过期时间应该等于时间窗口长度，再多宽限1秒
        pipe.expire(key, period+1)

        #批量操作
        _, _, current_count, _ = pipe.execute()
    # 比较数量是否超标
    return current_count <= max_count

def main():
    for i in range(30):
        time.sleep(0.5)
        print('i=', i, is_action_allowed('codehole', 'reply', 60, 5))


if __name__ == "__main__":
    main()