# 用户权限及数据库

## 数据库创建

```sql
create database exampledb default character set utf8 collate utf8_general_ci;
grant all privileges on exampledb to 'exampleuser'@'127.0.0.1' identified by 'examplepasswd';
```
