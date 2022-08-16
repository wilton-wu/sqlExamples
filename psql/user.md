## 查询用户权限

```
# 列出所有权限
SELECT grantor, grantee, table_schema, table_name, privilege_type
FROM information_schema.table_privileges
WHERE grantee = 'myuser'

# 组合输出
SELECT grantee AS user, CONCAT(table_schema, '.', table_name) AS table,
    CASE
        WHEN COUNT(privilege_type) = 7 THEN 'ALL'
        ELSE ARRAY_TO_STRING(ARRAY_AGG(privilege_type), ', ')
    END AS grants
FROM information_schema.role_table_grants
GROUP BY table_name, table_schema, grantee;
```

## meta-command

```
# 列出用户
\du
# 列出数据库
\l
# 切换数据库
\c db2
# 列出表
\dt
```
