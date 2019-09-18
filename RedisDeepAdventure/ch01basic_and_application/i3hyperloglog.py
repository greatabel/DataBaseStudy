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
    for i in range(10000):
        client.pfadd('codehole', 'user%d' %i)
        total = client.pfcount('codehole')
    print(10000, client.pfcount('codehole'))

    client.pfadd('hyperlog1', *['foo', 'bar', 'foo', 'foobar', 'test'])
    client.pfadd('hyperlog2', *['foo', 'bar', 'man', 'xie', 'xiemanrui'])
    print(client.pfcount('hyperlog1'), client.pfcount('hyperlog2'))
    client.pfmerge('hyperlog1', 'hyperlog2')
    print(client.pfcount('hyperlog1'), client.pfcount('hyperlog2'))

if __name__ == "__main__":
    main()