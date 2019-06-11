# client

+ `client list`, 以人类可读的格式, 返回所有连接到服务器的客户端信息和统计数据
+ `client setname connection-name`, 为当前连接分配一个名字
+ `client getname`, 如果连接没有设置名字, 那么返回空白回复;  如果有设置名字, 那么返回名字
+ `client kill ip:port`, 关闭地址为`ip:port`的客户端

