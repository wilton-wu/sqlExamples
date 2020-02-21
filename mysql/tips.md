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

# 查看表存储大小和存储行数
select table_name, (data_length+index_length)/1024/1024 as total_mb, \
       table_rows from information_schema.tables where table_schema='dbname';
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
