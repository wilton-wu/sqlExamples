# index

```
# 显示索引信息
show index from mytable\G;

# 使用alter命令添加和删除主键
ALTER TABLE testalter_tbl MODIFY i INT NOT NULL;
ALTER TABLE testalter_tbl ADD PRIMARY KEY (i);
ALTER TABLE testalter_tbl DROP PRIMARY KEY;

# 使用alter命令添加和删除索引
ALTER TABLE testalter_tbl ADD INDEX (c);
ALTER TABLE testalter_tbl DROP INDEX c;
```

## 普通索引

```
# 创建表时创建索引
create table mytable(
    ID INT NOT NULL,
    columnName VARCHAR(15) NOT NULL,
    INDEX [INDEXName] (columnName(length))
);

# 创建索引
# 如果是CHAR, VARCHAR类型, length可以小于字段实际长度
# 如果是BLOB和TEXT类型, 必须指定 length
create index [IndexName] on mytable(columnName(length));

# 修改表结构(添加索引)
alter table mytable add index [IndexName] (columnName(length)); 

# 删除索引
drop index [IndexName] on mytable;
```

## 唯一索引

索引列的值必须唯一, 允许有空值; 如果是组合索引, 列值的组合必须唯一

```
# 创建表时指定
```
create table mytable(
    ID INT NOT NULL,
    columnName VARCHAR(15) NOT NULL,
    UNIQUE [INDEXName] (columnName(length))
);

# 创建索引
create unique index [indexName] on mytable(columnName(length));

# 修改表结构
alter table mytable add unique [IndexName] (columnName(length)); 
```

