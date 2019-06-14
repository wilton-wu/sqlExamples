# 备份与恢复

## mysqldump

```
mysqldump -u [username] -p [databaseName] > [filename]-$(date +%F).sql

# Create a backup of an entire Database Management System (DBMS)
mysqldump --all-databases --single-transaction --quick --lock-tables=false > full-backup-$(date +%F).sql -u root -p

# Back up a specific database
mysqldump -u username -p db1 --single-transaction --quick --lock-tables=false > db1-backup-$(date +%F).sql

# Back up a single table
mysqldump -u username -p --single-transaction --quick --lock-tables=false db1 table1 > db1-table1-$(date +%F).sql
```

## crontab

```
# .my.cnf
[client]
user = root
password = yourpassword

# cron job file
# /etc/cron.daily/mysqldump
0 1 * * * /usr/bin/mysqldump --defaults-extra-file=/home/example_user/.my.cnf -u root --single-transaction --quick --lock-tables=false --all-databases > full-backup-$(date +\%F).sql
```
