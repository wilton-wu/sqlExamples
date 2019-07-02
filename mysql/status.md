# 状态信息查看

```
# 查看查询的处理情况
show engine innodb status\G;

# 查看表状态
show table status\G;

# sql_mode
select @@GLOBAL.sql_mode;
select @@SESSION.sql_mode;
set GLOBAL sql_mode = "modes...";
set SESSION sql_mode = "modes...";
```
