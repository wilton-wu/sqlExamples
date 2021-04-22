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

# 更新同一张表另一行的数据
update tableA a join tableA b 
on a.field1 = b.field1 set a.field2 = b.field2, 
a.field3 = b.field3 where a.field4 = "xxx1" and b.field4 = "xxx2" and a.rield2 = "xx";
```
