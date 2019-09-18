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

@  如果爆款页面有几千万UV，你需要很大set统计，非常浪费空间。
为了去重功能耗费这么多存储空间，值得吗？其实老板需要的数据并不需要太精确，
105万 和 106万 2个数字没有多大区别。
    Redis提供了HyperLogLOg 就是解决这种统计问题，提供不精确的去重计数方案，
虽然不精确，但是不是非常离谱，标准误差是0.81%，这个京都已经可以满足上面的UV统计需求。

@ HyperLogLog的数据结构发明人是Philippe Flajolet, pfadd的pf是名字缩写


@ BoomFilter 布隆过滤器可用在：
爬虫系统，对URL去重，一旦url太多，几千万上亿，如果用一个集合装url地址，非常浪费空间。
它可以大幅度降低去重存储消耗，只不过也会让爬虫错过少量页面。

布隆过滤器在 NoSQL 数据库领域非常广泛，HBase, Cassandra，还有LevelDB，RocksDB
内部都有布隆过滤器结构，可以显著降低数据库的IO请求数量，当用户请求某个row，可以先通过
内存中的布隆过滤器过滤掉大量不存在的row请求，然后再去磁盘查询

邮箱的垃圾邮件过滤功能也普遍用了布隆过滤器，所以平时某些正常邮件被放入垃圾邮件目录，
这就是误判

@ redis4.0提供了限流模块：Redis-Cell, 使用漏斗算法
   只有1条命令: cl.throttle (节流阀的意思)

@
GEOHash算法：2维度的经纬度映射到一维度的整数，然后对整数做base32编码
redis做geo查询，内部是zset

@ keys codehole*
简单粗暴的key：
没有offset,limit; 遍历算法，复杂度O(n)
所以提供了scan指令

@


