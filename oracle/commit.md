# Oracle什么时候需要Commit

sql语言分为五大类：
  + DDL，数据定义语言，Create、Alter、Drop这些语句自动提交，无需用Commit提交
  + DQL，数据查询语言，Select查询语句不存在提交问题
  + DML，数据操纵语言，Insert、Update、Delete这些语句需要Commit才能提交
  + DTL，事务控制语言，Commit、Rollback事务提交与回滚语句
  + DCL，数据控制语言，Grant、Revoke授予权限与回收权限语句

执行完DML语句，若没有commit再执行DDL语句，也会自动commit未被commit的数据。

如果打开自动提交，DML操作后也不需要手动提交：`SET AUTOCOMMIT ON;`
