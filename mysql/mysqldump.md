# mysqldump

## 导出

如果只导出表结构不导出数据, 添加`--no-data`选项

```
# 导出所有数据库
mysqldump -uroot -ppassword --all-databases > /path/to/all.sql

# 导出指定数据库
mysqldump -uroot -ppassword --databases exampledb > /path/to/exampledb.sql

# 导出指定表
mysqldump -uroot -ppassword exampledb exampletable > /path/to/exampletable.sql

# 导出多张表
mysqldump -uroot -ppassword exampledb table1 table2 > /path/to/tables.sql

# 导出表数据到文件中
select * from table1 into outfile '/path/to/a.txt';
```

## 导入

```
# 导入指定数据库
mysql -uroot -ppassword mydb1 < /path/to/mytable1.sql
# 或者在mysql内执行以下命令
use mydb1;
source /path/to/mytable1.sql;

# 导入表数据
mysql -uroot -ppassword --default-character-set=utf8
use mydb1;
load data infile '/path/to/a.txt' into table table1 CHARACTER SET utf8;
```
