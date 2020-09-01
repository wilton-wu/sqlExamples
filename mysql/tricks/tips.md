# tips

```
# 拼出删除多张表的语句
select concat('drop table ', group_concat(table_name), ';')
    as statement from information_schema.tables
    where table_name like 'exam_%';

# 判断数据库或表是否存在
create database if not exists dbname;
drop table if exists tbname;

# 查看表创建的语句
show create table tbname\G;

# 查看列
show columns from tablename;

# 查看表存储大小和存储行数
select table_name, (data_length+index_length)/1024/1024 as total_mb, \
       table_rows from information_schema.tables where table_schema='dbname';

# 重命名表
alter table table_name rename to new_table_name;

# 一次性删除多个index
ALTER TABLE mytable
    DROP INDEX ndx1,
    DROP INDEX ndx2,
    DROP INDEX ndx3;

# 查找表
show tables like 'test%';
```

## 一条sql语句分多行输入

```
# 输入sql语句没有以分号结尾时，
# 系统会将sql按照多行来输入
mysql> select
 -> version(),
 -> current_date
 -> ;
# 输入一个'\c'来作为取消的关键词
mysql> select
 -> version,
 -> current_date
 -> \c
mysql>
```
