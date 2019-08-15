# tips

```
# 拼出删除多张表的语句
select concat('drop table ', group_concat(table_name), ';')
    as statement from information_schema.tables
    where table_name like 'exam_%';
```
