'''

'''

import redis

def main():
    client = redis.StrictRedis(host='localhost',
                                port=6379,
                                db=0)
    for i in range(1000):
        client.pfadd('codehole', 'user%d' %i)
        total = client.pfcount('codehole')
        if total != i+1:
            print(total, i+1)
            break
    print('-'*20, '查看更大量数据差异')
    for i in range(100000):
        client.pfadd('codehole', 'user%d' %i)
        total = client.pfcount('codehole')
    print(100000, client.pfcount('codehole'))   

if __name__ == "__main__":
    main()