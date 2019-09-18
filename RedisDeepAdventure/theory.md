@ Redis是个单线程程序，其实node.js/Nginx也是单线程
 Rdis单线程还快的原因是：所有数据在内存，所有运算是内存级别的运算。

@ Redis单线程，怎么处理那么多并发客户端链接？
事件轮询（多路复用）
    最简单的事件轮询 API是select函数，它是操作系统提供给用户程序的API
我们通过select系统调用同时处理多个通道描述符符的读写事件，这类系统成为多路复用API
现代操作系统多路复用API不再是select系统调用，而改用epoll(linux)和 kqueue(freebsd macOSX)

@ Redis持久化有2种：一种是快照（全量备份)，一种是AOF日志(增量备份)
redis使用操作系统多进程COW (copy on write)机制实现快照持久化