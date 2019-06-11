# commands

```
exists <key>  # 确认一个<key>是否存在
del <key>  # 删除一个<key>
type <key>  # 返回值的类型
randomkey  # 随机返回一个key
dbsize  # 返回当前数据库中key的数目
expire <key> <seconds>  # 设定<key>的活动时间
ttl <key>  # 获得<key>的活动时间
rename <oldname> <newname>  # 将key重命名
set <key> <value>  # 给<key>赋值
get <key>  # 获取<key>的值
select <dbindex>  # 进入指定数据库
move <key> <dbindex>  # 将<key>转移到指定数据库
flushdb  # 删除当前数据库中所有key
flushall  # 删除所有数据库中所有key
```

