# shutdown

shudown命令执行以下操作:
+ 停止所有客户端
+ 如果有至少一个保存点在等待, 执行SAVE命令
+ 如果AOF选项被打开, 更新AOF文件
+ 关闭redis服务器(server)

如果持久化被打开的话, shutdown命令会保证服务器正常关闭而不丢失任何数据


## SAVE 和 NOSAVE 修饰符

+ 执行`SHUTDOWN SAVE`会强制让数据库执行保存操作, 即使没有设定(configure)保存点
+ 执行`SHUTDOWN NOSAVE`会阻止数据库执行保存操作, 即使已经设定有一个或多个保存点(你可以将这一用法看作是强制停止服务器的一个假想的 ABORT 命令)
