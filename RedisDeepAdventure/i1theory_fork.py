'''

https://stackoverflow.com/questions/33560802/pythonhow-os-fork-works

'''

import os
import time


for i in range(2):
    print('**********%d***********' % i)
    pid = os.fork()
    if pid == 0:
        # We are in the child process.
        print("%d (child) just was created by %d." % (os.getpid(), os.getppid()) )
    else:
        # We are in the parent process.
        print("%d (parent) just created %d." % (os.getpid(), pid) )