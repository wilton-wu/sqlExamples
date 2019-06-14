#!/bin/bash

# 数据库重命名

mysql -uroot -p123456 -e 'create database if not exists new_testdb'

list_table=$(mysql -u root -p123456 -Nse "select table_name from information_schema.tables where table_schema='testdb'")

for table in $list_table; do
    mysql -uroot -p123456 -e "rename table testdb.$table to new_testdb.$table"
done
