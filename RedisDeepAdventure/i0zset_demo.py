'''

zset 有序列表，可能是Redis最有特色的数据结构

zset 可以存储粉丝列表，value值是粉丝id，score是关注时间，
可以对粉丝列表按关注时间排序

#----------------------------#



'''

import time
from termcolor import colored


def main_process():
    print(colored('mycount=', 'red'), 'results')

if __name__ == "__main__":
    tic = time.process_time()
    
    main_process()

    toc = time.process_time()
    print("time=",toc - tic)





