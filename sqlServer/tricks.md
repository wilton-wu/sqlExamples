# 使用技巧

```sql
# 强制删除数据库（解决删除数据库报'in use'的错误）
USE master;
GO
ALTER DATABASE dbname SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE dbname;
```
