# Oracle什么时候需要Commit

sql语言分为五大类：
  + DDL，数据定义语言，Create、Alter、Drop这些语句自动提交，无需用Commit提交
  + DQL，数据查询语言，Select查询语句不存在提交问题
  + DML，数据操纵语言，Insert、Update、Delete这些语句需要Commit才能提交
  + DTL，事务控制语言，Commit、Rollback事务提交与回滚语句
  + DCL，数据控制语言，Grant、Revoke授予权限与回收权限语句

Oracle数据库的默认事务隔离级别是提交读（Read Committed）。提交数据有三种类型：显式提交、隐式提交及自动提交。执行命令`COMMIT`完成的提交为显式提交；执行完DML语句，若没有commit再执行DDL语句，也会自动commit未被commit的数据，称为隐式提交；如果打开自动提交，DML操作后也不需要手动提交：`SET AUTOCOMMIT ON;`，这种叫做自动提交。可以使用`show autocommit`语句查看当前是否设置为自动提交。
