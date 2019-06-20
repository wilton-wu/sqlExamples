# mysqlbinlog

## 查看

```
# -v, --verbose  用于输出row模式的binlog日志, -vv为列数据类型添加注释
# --base64-output=decode-rows  解码binlog里经过base64编码的内容
# -d, --database  指定数据库
mysqlbinlog -vv --base64-output=decode-rows mysqlbinlog.0001

# 基于开始/结束时间
--start-datetime='2018-01-02 12:23:00' --stop-date-time='2019-01-02 02:02:00'

# 基于pos值
--start-postion=107 --stop-position=1000

# 过滤指定表
# -B, before, 前面; -A, after, 后面
grep -B3 -A6 -w tb_name data.sql | grep -v '^--$' > tb_name.sql
```

## 恢复

```
mysqlbinlog --start-position=1847 --stop-position=2585 mysql-bin.000008 > test.sql
mysql> source /var/lib/mysql/3306/test.sql
```

## 远程获取binlog

```
mysqlbinlog -u user -p -h xxx.mysql.rds.aliyun.com  --read-from-remote-server mysql-bin.000497 > a.binlog
```

