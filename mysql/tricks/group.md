# 分组

```sql
# 使用多个字段进行分组
select DISTINCT fname, lname from testing;
select fname, lname from testing group by fname, lname;
```
