@ 
Stream 借鉴了Kafka 的消费分组概念，弥补了Redis PubSub的不能持久化消息的缺陷

# 每秒执行多少次指令
redis-cli info stats | grep ops

链接多少客户端
redis-cli info clients