# 慢日志

```
# 获取慢日志
select * from mysql.slow_log;

# 使用tee命令导出慢查询明细
# tee命令可以导出一个session内执行的sql语句及执行结果
tee /tmp/slowlog.txt
select * from mysql.slow_log\G;
```
