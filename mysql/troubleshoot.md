# mysql设计和优化

## Explain

Explain可以帮助开发人员分析SQL问题, 
explain显示了mysql如何使用索引来处理select语句以及连接表, 
可以帮助选择更好的索引和写出更优化的查询语句

```
Explain select columnName from mytable where columnName2 = "something";
```
