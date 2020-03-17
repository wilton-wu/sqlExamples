# 用户权限及数据库

## 用户管理

```sql
# 添加用户
create user username1 identified by 'password1';

# 查看用户
select user,host from mysql.user where user = 'username1';

# 授权
grant all privileges on db1.* to username1@'%' identified by 'password1';
flush privileges;

# 查看新增数据库权限信息
select user,db,host,select_priv,insert_priv,update_priv,delete_priv from mysql.db where user="username1";
show grants for 'username1';

# 修改密码
update mysql.user set authentication_string=password() where user='username1' and host='%';
flush privileges;

# 删除用户
drop user username1@'%';
```

## 数据库管理

```sql
# 创建数据库
create database exampledb default character set utf8 collate utf8_general_ci;
grant all privileges on exampledb.* to 'exampleuser'@'127.0.0.1' identified by 'examplepasswd';
flush privileges;
```
