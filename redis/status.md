# redis info, 获取redis服务器的各种信息和统计数

info命令会反馈出服务的统计信息, 并以分组的形式进行展现

## 用法

```
# 定向显示一组信息
info [section]

# 显示所有默认信息
info
info default

# 显示全部信息
info all
```

## 分组

```
Server  # Redis服务的基础信息
Clients  # 客户端连接信息
Memory  # 内存开销相关信息
Persistence  # 持久化
Stats  # 基础统计
Replication  # 主备复制
# CPU  # CPU开销
# Cluster  # 集群
# Keyspace  # 数据库相关统计
# Commandstats  # redis命令相关统计
```
