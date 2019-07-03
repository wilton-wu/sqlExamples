# commands

## string, 字符串

```
set <key> <value>  # 给<key>赋值
get <key>  # 获取<key>的值
del <key>  # 删除一个<key>
expire <key> <seconds>  # 设定<key>的活动时间
ttl <key>  # 获得<key>的活动时间 (-1, 永不过期; -2, 已经过期)
incr <key>  # 让<key>的值自增
```

## list, 列表

```
rpush <listname> <value>  # 在列表的右侧添加值
lpush <listname> <value>  # 在列表的左侧添加值
lrange <listname> <start> <end>  # 从左开始按照对应的范围去取列表值
  redis的列表从0开始标记元素, -1表示一直到最后一个列表值
  lrange listexample 0 -1, 取列表所有值
llen <listname>  # 显示列表的长度
lpop <listname>  # 删除列表左起第一个元素
rpop <listname>  # 删除列表右起第一个元素
```

## set, 集合

```
sadd <setname> <value>  # 在集合中添加值
srem <setname> <value>  # 删除集合中的指定值
sismember <setname> <value>  # 测试某个值是否在集合中
smembers <setname>  # 显示当前集合的所有值
sunion <setname1> <setname2>  # 显示集合的合并值
sinter <setname1> <setname2>  # 显示集合中的交集
sinterstore <setname3> <setname1> <setname2>  # 将集合中的交集存入到第一个参数中
```

## sorted set, 有序集合

```
zadd <zsetname> <score> <value>  # 在有序集合中添加元素
zrange <zsetname> <start> <end>  # 查看有序集合的元素
zcount <zsetname> <min> <max>  # 显示有序集合在指定score中的数量
zrevrank <zsetname> <value>  # 显示指定元素的对应等级
```

## hash, 哈希

```
hset <hashname> <field> <value>  # 在哈希中添加元素
hgetall <hashname>  # 查看哈希中的所有元素
hmset <hashname> <field1> <value1> <field2> <value2>  # 一次设置多个值
hget <hashname> <field>  # 只获取哈希类型的指定元素
hincrby <hashname> <field> <increment>  # 对哈希值自增
hdel <hashname> <field>  # 删除对应的哈希值
```


## 其他

```
exists <key>  # 确认一个<key>是否存在
type <key>  # 返回值的类型
randomkey  # 随机返回一个key
dbsize  # 返回当前数据库中key的数目
rename <oldname> <newname>  # 将key重命名
select <dbindex>  # 进入指定数据库
move <key> <dbindex>  # 将<key>转移到指定数据库
flushdb  # 删除当前数据库中所有key
flushall  # 删除所有数据库中所有key
```

