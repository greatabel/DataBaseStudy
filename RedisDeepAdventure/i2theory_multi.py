'''

'''

import time
from termcolor import colored
import redis 

# Create a redis client
r = redis.StrictRedis(host='localhost',
                                port=6379,
                                db=0)

def main_process():
    
    r.set('bing', 10)
    # Use the pipeline() method to create a pipeline instance
    pipe = r.pipeline()
    # The following SET commands are buffered
    pipe.multi()
    pipe.incr('bing')
    pipe.incr('bing')
    values = pipe.execute()
    t = pipe.get('bing')
    print(values, 't=', t)
    # the EXECUTE call sends all buffered commands to the server, returning
    # a list of responses, one for each command.
    pipe.execute()

if __name__ == "__main__":
    tic = time.process_time()
    
    main_process()

    toc = time.process_time()
    print("time=",toc - tic)





