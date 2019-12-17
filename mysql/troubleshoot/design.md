# mysql设计和优化

## Explain

Explain可以帮助开发人员分析SQL问题, 
explain显示了mysql如何使用索引来处理select语句以及连接表, 
可以帮助选择更好的索引和写出更优化的查询语句

```
Explain select columnName from mytable where columnName2 = "something";
```

## 重新整理表

```
alter table tablename engine=innodb;
```

## 用新表替换旧表

```
# 创建新表
CREATE TABLE newtablename like tablename;
INSERT INTO newtablename SELECT * FROM tablename;

# 重命名
RENAME TABLE tablename TO tablename.backup;
RENAME TABLE newtablename TO tablename;

# 删除旧表
DROP TABLE tablename.backup;
```

## 使用show profiles分析性能

```
# 查看是否启用, profiling为用户变量, 每次都得重新启用
select @@profiling;

# 开启profiling
set profiling=1;

# 查看语句执行时间
show profiles;

# 查看某个语句的详细时间耗费
show profile for query 2;

# 占用cpu, io等信息
show profile block io, cpu, memory, swaps, context switches, source for query 2;
```
