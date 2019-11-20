# mysql查询结果输出到文件

```
# 直接执行命令
select count(1) from table into outfile '/tmp/test.xls';

# 查询都自动写入文件
pager cat > /tmp/test.txt;

# 跳出mysql命令行
mysql -h 127.0.0.1 -u root -p xxxx -P 3306 -e "select * from table" > /tmp/test/result.txt
```
