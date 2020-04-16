# 日期操作

```sql
# 修改日期字段hour值
update table_name set date_field = DATE_ADD(date_field, INTERVAL (15 - HOUR(date_field)) HOUR);

```
