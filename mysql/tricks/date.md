# 日期操作

```sql
# 修改日期字段hour值为15
update table_name set date_field = DATE_ADD(date_field, INTERVAL (15 - HOUR(date_field)) HOUR);

# 将日期字段month值减一
update table_name set date_field = DATE_ADD(date_field, INTERVAL -1 MONTH)
```
