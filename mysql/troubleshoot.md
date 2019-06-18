# mysql设计和优化

## Explain

Explain可以帮助开发人员分析SQL问题, 
explain显示了mysql如何使用索引来处理select语句以及连接表, 
可以帮助选择更好的索引和写出更优化的查询语句

```
Explain select columnName from mytable where columnName2 = "something";
```

## 用新表替换旧表

```
# 创建新表
CREATE TABLE newtablename like tablename;
INSERT INTO newtablename SELECT * FROM tablename;

# 重命名
RENAME TABLE tablename TO tablename.backup;
RENAME TABLE newtablename TO tablename;

# 删除旧表
DROP TABLE tablename.backup;
```
