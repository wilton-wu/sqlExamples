# 状态信息查看

## innodb

```
# 查看查询的处理情况
show engine innodb status\G;
```

## 获取表信息

```
# 查看表状态
show table status\G;
show table status like 'something%'\G;
```

## 变量

```
# sql_mode
select @@GLOBAL.sql_mode;
select @@SESSION.sql_mode;
set GLOBAL sql_mode = "modes...";
set SESSION sql_mode = "modes...";
```
