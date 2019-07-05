# 使用show profiles分析性能

```
# 查看是否启用, profiling为用户变量, 每次都得重新启用
select @@profiling;

# 开启profiling
set profiling=1;

# 查看语句执行时间
show profiles;

# 查看某个语句的详细时间耗费
show profile for query 2;

# 占用cpu, io等信息
show profile block io, cpu, memory, swaps, context switches, source for query 2;
```


