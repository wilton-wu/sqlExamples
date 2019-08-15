# 连接数, 状态

```
# 查看最大连接数
show variables like '%max_connections%';

# 设置最大连接数
set global max_connections = 1000;

# 查看线程信息
# Threads_connected, 指打开的连接数, 当前连接数
# Threads_running, 指激活的连接数, 当前并发数
show status like 'Threads';

```

## processlist

```
# 显示用户占用的连接
# 有process权限的用户能看到所有用户的当前连接
show processlist;  # 只列出前100条
show full processlist;  # 全列出
```

`show processlist`显示的信息都是来自mysql系统库information_schema中的`processlist`表

```
# 按客户端IP分组
select client_ip, count(client_ip) as client_num from (select substring_index(host, ':', 1) as client_ip from information_schema.processlist ) as connect_info group by client_ip order by client_num desc;

# 查看正在执行的线程
select * from information_schema.processlist where Command != 'Sleep' order by Time desc;

# 找出执行时间超过5分钟的线程
select concat('kill ', id, ';') from information_schema.processlist where Command != 'Sleep' and Time > 300 order by Time desc;
```
