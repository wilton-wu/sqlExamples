# 更新数据

```sql
# 从另外一张表获取值
UPDATE TableB 
SET field1 = (
    SELECT field2 
    FROM TableA
    WHERE TableA.name = TableB.name
);
```
