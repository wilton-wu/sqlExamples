# 登录到mysql查看binlog

```
# binlog信息查询
show variables like '%log_bin%';

# 查看当前正在写入的binlog文件
show master status\G;

# 获取binlog文件列表
show binary logs;
show master logs;

# 只查看第一个binlog文件的内容
show binlog events;

# 查看指定binlog文件内容
show binlog events [in 'log_name'] [from pos] [limit [offset,] row_count];
show binlog events in 'mysql-bin.000002' from 1190 limit 2\G;
```
