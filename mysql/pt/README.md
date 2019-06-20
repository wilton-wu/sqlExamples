# Percona-Toolkits

percona-toolkit, 是一组高级命令行工具的集合, 用来执行各种通过手工执行非常复杂和麻烦的mysql任务和系统任务

## pt-online-schema-change

```
# 在alter操作更改表结构的时候不用锁定表, 即执行alter的时候不会阻塞写和读取操作
# 执行这个工具的时候必须做好备份
# 工作原理是创建一个和你要执行 alter 操作的表一样的空表结构, 执行表结构修改
# 然后从原表中 copy 原始数据到表结构修改后的表, 当数据 copy 完成以后就会将原表移走
# 用新表代替原表, 默认动作是将原表 drop 掉
# 在 copy 数据的过程中, 任何在原表的更新操作都会更新到新表
# 因为这个工具在会在原表上创建触发器, 触发器会将在原表上更新的内容更新到新表
# 如果表中已经定义了触发器这个工具就不能工作了
pt-online-schema-change --lock-wait-time=120 --alter="ENGINE=InnoDB" D=database,t=table --execute
pt-online-schema-change --lock-wait-time=120 --alter="ADD COLUMN domain_id INT"D=database,t=table --execute

# 增加字段
pt-online-schema-change --no-version-check --execute --alter "add column c1 int" h=xxx.com,P=3306,u=jacky,p=xxx,D=jacky,t=x

# 删除字段
pt-online-schema-change --no-version-check --execute --alter "drop column c1" h=xxx.com,P=3306,u=jacky,p=xxx,D=jacky,t=x

# 修改字段类型
pt-online-schema-change --no-version-check --execute --alter "modify column c1 bigint unsigned" h=xxx.com,P=3306,u=jacky,p=xxx,D=jacky,t=x

# 添加索引
pt-online-schema-change --no-version-check --execute --alter "add key idx_c1 (c1)" h=xxx.com,P=3306,u=jacky,p=xxx,D=jacky,t=x

# 删除索引
pt-online-schema-change --no-version-check --execute  --alter "drop key idx_c1" h=xxx.com,P=3306,u=jacky,p=xxx,D=jacky,t=x
```

## pt-archiver

pt-archiver时Percona官方提供的归档工具, 用于归档大型表中的记录到另一个表或文件

```
# 归档到操作系统文件
pt-archiver --source h=xxx.com,P=3306,u=jacky,p=xxx,D=jacky,t=my_tab --charset=utf8 --file '/var/tmp/%Y-%m-%d-%D.%t' --where "id > 3008" --limit 1000 --commit-each --no-version-check

# 归档到同实例不同库下的表
pt-archiver --source h=xxx.com,P=3306,u=jacky,p=xxx,D=jacky,t=my_tab --charset=utf8 --dest h=xxx.com,P=3306,u=jacky,p=xxx,D=my_db,t=my_tab --where "id > 2000" --limit 1000 --commit-each --no-version-check

# 归档到不同实例下的表
pt-archiver --source h=xxx01.com,P=3306,u=jacky,p=xxx,D=jacky,t=my_tab --charset=utf8 --dest h=xxx02.com,P=3306,u=jacky,p=xxx,D=jacky,t=my_tab --where "id > 500" --limit 1000 --commit-each --no-version-check

# 加速归档
# --bulk-insert, 批量插入数据, 会自动启用--bulk-delete --commit-each, 每次插入行数通过--limit选项指定
# --statistics, 显示本次操作的统计信息
pt-archiver --source h=xxx01.com,P=3306,u=jacky,p=xxx,D=rd_test,t=large_tab_04 --charset=utf8 --dest h=xxx02.com,P=3306,u=jacky,p=xxx,D=jacky,t=large_tab_04 --where "1=1" --limit 5000 --commit-each --bulk-insert --no-version-check --statistics
```

## summary

```
# 查看系统摘要报告
pt-summary

# 查看mysql各个统计信息
pt-mysql-summary --user=root --password=123456 --host=192.168.200.25 --port=3306

# 查找重复索引和外键
pt-duplicate-key-checker --h localhost --u root --p 123456 -d test

# 对比配置文件的异同
pt-config-diff h=localhost,P=3306 h=192.168.200.25,P=3307 --user=root --password=123456
pt-config-diff /usr/local/mysql/share/mysql/my-large.cnf /usr/local/mysql/share/mysql/my-medium.cnf

# 分析mysql的变量(my.cnf)
pt-variable-advisor --user=root --password=123456  192.168.220.245

# pt-query-advisor, 根据一些规则分析查询语句
pt-query-advisor /path/to/slow-query.log
pt-query-advisor --type genlog mysql.log
pt-query-digest --type tcpdump.txt --print --no-report | pt-query-advisor
pt-query-advisor --query "select * from test"
pt-query-advisor /path/to/general.log
pt-query-advisor /path/to/localhost-slow.log

# pt-show-grants, 规范化和打印mysql权限
pt-show-grants --h localhost --u root --p 123456
pt-show-grants --h localhost --u root --p 123456 -d test
pt-show-grants --h localhost --u root --p 123456 -d test --revoke

# pt-index-usage, 从log文件中读取查询语句, 
# 并用explain分析
pt-index-usage /path/to/slow.log --h localhost --u root --p 123456 -d test --no-report --create-save-results-database

# pt-pmp, 为查询程序执行聚合的GDB堆栈跟踪
pt-pmp -p 21933
pt-pmp -b /usr/local/mysql/bin/mysqld_safe

# pt-visual-explain
# 格式化 explain 出来的执行计划按照 tree 方式输出, 方便阅读
pt-visual-explain --connect aaa --h localhost --u root --p 123456 -d test
pt-visual-explain `mysql --h localhost --u root --p 123456 -d test -e "explain select testx from test where id=1"`
```
