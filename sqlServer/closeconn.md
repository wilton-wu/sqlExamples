# 强制关闭数据库连接

## 直接关闭

```
USE master  
GO 

declare @i int declare cur cursor for
select spid
  from sysprocesses
 where db_name(dbid)= 'fyowdb_dev' open cur fetch next
  from cur into @i while @@fetch_status= 0 begin exec('kill '+ @i) fetch next
  from cur into @i end close cur deallocate cur
```

## 使用存储过程

```sql
-- 关闭用户打开的进程处理 
USE master  
GO 

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[p_killspid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)  
  DROP PROCEDURE [dbo].[p_killspid]  
GO  

create proc p_killspid 
@dbname varchar(200) -- 要关闭进程的数据库名 
as 
declare @programName nvarchar(200), 
@spid nvarchar(20) 
  
declare cDblogin cursor for 
select cast(spid as varchar(20))  AS spid from master..sysprocesses where dbid=db_id(@dbname) 
open cDblogin  
fetch next from cDblogin into @spid 
while @@fetch_status=0 
begin  
-- 防止自己终止自己的进程  
-- 否则会报错不能用KILL 来终止您自己的进程 
IF  @spid <> @@SPID  
  exec( 'kill '+@spid) 
fetch next from  cDblogin into @spid 
end 
close cDblogin 
deallocate cDblogin  
GO 
  
-- 用法 
exec p_killspid 'fdoam'  
```
