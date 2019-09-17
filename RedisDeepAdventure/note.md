@Redis是 Remote Dictionary Service（远程字典服务）首字母缩写
6379默认端口，是手机键盘字母MERZ位置决定的，意大利女郎“Merz”的名字

@ osx上启动、停止命令：
brew services start redis
brew services stop redis
重启：
brew services restart redis


@Redis有5种基础数据结构：
string
list
hash
set
zset

@ SETNX 是『SET if Not eXists』(如果不存在，则 SET)的简写

@字符串类型可以存储任何形式的字符串，当存储的字符串是整数形式时，
Redis提供了一个实用的命令INCR，其作用是让当前键值递增，并返回递增后的值

@查看本机redis版本：redis-server --version

@ HyperLogLog的数据结构发明人是Philippe Flajolet, pfadd的pf是名字缩写