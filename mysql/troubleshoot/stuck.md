# 删除表、数据库一直未响应

## 某些语句执行卡住导致无法删除

```sql
# 查询进程, 查看Waiting的进程
sql> show full processlist;

# 结束Waiting的进程
sql> kill process_id;
```

## 某些事务没有提交

```
# 查询未提交的事务, 查看trx_mysql_thread_id值
sql> select * from information_schema.INNODB_TRX;

# 结束事务线程
sql> kill process_id;
```

## 有失败的语句

```
# 查询失败的语句
sql> select * from performance_schema.events_statements_current;

# 结束失败的进程
sql> kill process_id;
```
