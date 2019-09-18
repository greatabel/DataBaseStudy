'''

'''

import redis

def main():
    client = redis.StrictRedis(host='localhost',
                                port=6379,
                                db=0)
    client.delete('codehole')

    for i in range(1000):
        client.execute_command('bf.add', 'codehole', 'user%d' %i)
        ret = client.execute_command('bf.exists', 'codehole', 'user%d' %i)
        if ret == 0:
            print(i)
            break

if __name__ == "__main__":
    main()