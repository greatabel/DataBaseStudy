@ Redis是个单线程程序，其实node.js/Nginx也是单线程
 Rdis单线程还快的原因是：所有数据在内存，所有运算是内存级别的运算。

@ Redis单线程，怎么处理那么多并发客户端链接？
    非阻塞IO  在套接字对象提供一个选项Non_blocking，读写方法不会阻塞。能读多少取决于内核为套接字
分配的读缓冲区的数据字节数，能写多少取决于内核为套接字分配的写缓冲区的空闲字节数。读写都通过返回值
告知程序实际读写多少字节。
    非阻塞IO的问题就是：线程如何知道何时才应该继续读，何时才应该继续写

    事件轮询API（多路复用）是解决这个的
    最简单的事件轮询 API是select函数，它是操作系统提供给用户程序的API
我们通过select系统调用同时处理多个通道描述符符的读写事件，这类系统成为多路复用API
现代操作系统多路复用API不再是select系统调用，而改用epoll(linux)和 kqueue(freebsd macOSX) 
windows的IOCP
    时间轮询API就是Java里面的NIO技术（Non-blocking I/O，在Java领域，也称为New I/O）
    而在Python3.4 中新增了 selectors 模块，用于封装各个操作系统所提供的 I/O 多路复用的接口

@ Redis持久化有2种：一种是快照（全量备份)，一种是AOF日志(增量备份)
redis使用操作系统多进程COW (copy on write)机制实现快照持久化