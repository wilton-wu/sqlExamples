# 复制数据库

```sql
USE master
GO

-- Query database engine edition
SELECT @@Version
GO

-- 源库: testddb, 新复制出来的库: testdb_copy
EXEC sp_rds_copy_database 'testdb','testdb_copy'
SELECT *
FROM sys.databases
WHERE name IN ('testdb','testdb_copy')
SELECT 
    family_guid,database_guid,* 
    FROM sys.database_recovery_status
    WHERE 
    DB_NAME(database_id) IN ('testdb','testdb_copy')
```
