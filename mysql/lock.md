# 锁、事务与并发控制

## mysql并发控制 (共享锁、排他锁)

+ 共享锁, 也称为读锁，允许多个连接可以同一时刻并发地读取统一资源，互不干扰
+ 排他锁, 也称为写锁，一个写锁会阻塞其他的写锁或读锁，保证同一时刻只有一个连接可以写入数据，同时防止其他用户对这个数据的读写

### 锁策略

锁的开销是较为昂贵的，锁策略就是保证线程安全的同时获取最大的性能。

+ 表锁(table lock), 最基本的所策略，开销最小，会锁定整个表
+ 行锁(row lock), 可以最大限度地支持并发处理，也带来了最大的开销

## 隔离级别

```sql
# 查看系统隔离级别
sql> select @@global.tx_isolation;

# 查看当前会话隔离级别
sql> select @@tx_isolation;

# 设置当前会话隔离级别
sql> SET session TRANSACTION ISOLATION LEVEL serializable;

# 设置全局系统隔离级别
sql> SET GLOBAL TRANSACTION ISOLATION LEVEL UNCOMMITTED;
```

+ READ UNCOMMITTED, 未提交读，可脏读
  + 事务中的修改，即使没有提交，对其他会话也是可见的
  + 可以读取未提交的数据--脏读，一般不使用这个隔离级别
+ READ COMMITTED, 提交读或不可重复读，幻读
  + 一般数据库默认使用这个隔离级别
  + 这个级别保证了一个事务如果没有完全成功(commit执行完)，事务中的操作对其他会话是不可见的
  + 这个隔离级别解决了脏读问题，但会对其他session产生两次不一致的读取结果
+ REPEATABLE READ, 可重复读
  + 一个事务中多次执行同一读SQL，返回结果一样
  + 这个隔离级别解决了脏读、幻读问题
+ SERIALIZABLE, 可串行化
  + 最强的隔离级别，通过给事务中每次读取的行加锁，写加写锁，保证不产生幻读问题
  + 但是会导致大量超时以及锁争用问题

## 多版本并发控制 (MVCC, multiple-version-concurrency-control)

是个行级锁的变种，它在普通情况下避免了加锁操作，因此开销更低。

虽然实现不同，但通常都是非阻塞读，对于写操作只锁定必要的行。


