'''

'''

import redis
import random

client = redis.StrictRedis(host='localhost',
                            port=6379,
                            db=0)
CHARS = ''.join([chr(ord('a') + i) for i in range(26)])


def random_string(n):
    chars = []
    for i in range(n):
        idx = random.randint(0, len(CHARS)-1)
        chars.append(CHARS[idx])
    return ''.join(chars)


def main():
    users = list(set([random_string(64) for i in range(10000)]))
    print('total users ', len(users))
    users_train = users[:int(len(users)/2)]
    users_test  = users[int(len(users)/2):]

    client.delete('codehole')
    falses = 0
    for user in users_train:
        client.execute_command('bf.add', 'codehole', user)
    print('trained')

    for user in users_test:
        ret = client.execute_command('bf.exists', 'codehole', user)
        if ret == 1:
            falses += 1
    print('#'*20)
    print(falses, len(users_test))

if __name__ == "__main__":
    main()