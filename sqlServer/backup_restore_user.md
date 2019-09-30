# 备份权限问题

```
CREATE LOGIN Backup_Restore_User WITH PASSWORD='admin12338'
GO
CREATE USER Backup_Restore_User FOR LOGIN Backup_Restore_User
GO
EXEC sp_addsrvrolemember 'Backup_Restore_User', 'dbcreator'
GO
EXEC sp_addrolemember 'db_owner','Backup_Restore_User'
GO
```
