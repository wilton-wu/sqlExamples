# 更新数据

```sql
# 从另外一张表获取值
UPDATE TableB 
SET field1 = (
    SELECT field2 
    FROM TableA
    WHERE TableA.name = TableB.name
);

# 使用inner join更新
UPDATE tableB
INNER JOIN tableA ON tableB.name = tableA.name
SET tableB.value = IF(tableA.value > 0, tableA.value, tableB.value)
WHERE tableA.name = 'Joe';
```
