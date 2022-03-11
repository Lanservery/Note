# 结束标识

 MySQL 的SQL语句以分号` ; `作为结束标识

# 退出 mysql

```mysql
mysql> exit
Bye
```

# 显示数据库

```mysql
mysql> SHOW DATABASES;
```

# 降序排序

```mysql
mysql>SELECT * from runoob_tbl ORDER BY submission_date ASC;  //降序 ASC
```

在 `MySQL` 命令行的默认设置下，事务都是自动提交的，即执行 `SQL` 语句后就会马上执行 `COMMIT` 操作。因此要显式地开启一个事务务须使用命令 `BEGIN` 或 `START TRANSACTION`，或者执行命令 `SET AUTOCOMMIT=0`，用来禁止使用当前会话的自动提交。

# 事务控制语句：

+ BEGIN 或 START TRANSACTION 显式地开启一个事务；
+ COMMIT 也可以使用 COMMIT WORK，不过二者是等价的。COMMIT 会提交事务，并使已对数据库进行的所有修改成为永久性的；
+ ROLLBACK 也可以使用 ROLLBACK WORK，不过二者是等价的。回滚会结束用户的事务，并撤销正在进行的所有未提交的修改；
+ SAVEPOINT identifier，SAVEPOINT 允许在事务中创建一个保存点，一个事务中可以有多个 SAVEPOINT；
+ RELEASE SAVEPOINT identifier 删除一个事务的保存点，当没有指定的保存点时，执行该语句会抛出一个异常；
+ ROLLBACK TO identifier 把事务回滚到标记点；
+ SET TRANSACTION 用来设置事务的隔离级别。InnoDB 存储引擎提供事务的隔离级别有READ UNCOMMITTED、READ COMMITTED、REPEATABLE READ 和 SERIALIZABLE。

# 查看数据表类型

```sql
SHOW TABLE STATUS 
```

# 查看数据类型

```sql
 SHOW COLUMNS FROM table_name;
```
