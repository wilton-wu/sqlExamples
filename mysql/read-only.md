# 只读模式

## mysql单实例数据库和master数据库

为了确保所有用户，包括具有super权限的用户也不能进行读写操作，
需要执行给所有的表加读锁的命令`flush tables with read lock;`，
使用`unlock tables;`解除全局的表读锁。

### 将mysql设置为只读状态的命令

```
show global variables like '%read_only%';
flush tables with read lock;
set global read_only=1;
show global variables like '%read_only%';
```

### 将mysql从只读状态设置为读写状态的命令

```
unlock tables;
set global read_only=0;
```

## 需要保证master-slave主从同步的slave库

```
# 将slave从库设置为只读状态
set global read_only=1;

# 将slave从只读状态变为读写状态
set global read_only=0;
```

+ read_only=1只读模式不会影响slave同步复制的功能
+ read_only=1可以限定普通用户进行数据修改的操作，但不会限定super权限的用户

## 设置表只读

```
# 设置单独的表只读，退出会话会失效
lock table table_name read;

# 解锁
unlock tables;
```
