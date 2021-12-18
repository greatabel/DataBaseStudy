@
CAP原理
Consistent        一致性
Availablity       可用性
Pation tolerance  分区容忍性
CAP原理就是：当网络分区发生，一致性和可用性两难全

@Redis 主从数据是异步同步，不满足一致性。
当客户端在redis主节点修改了数据，即使主从网络断开，主节点依然可以提供服务

Redis保持 最终一致性，从节点会追赶主节点。
