#!/bin/bash

yum install http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm
#yum -y  install  Percona-Server-server-56.x86_64  Percona-Server-devel-56.x86_64  Percona-Server-shared-56.x86_64

yum install Percona-Server-server-56
# yum remove Percona-Server*

# service mysql start
# service mysql status
# service mysql stop
# service mysql restart

mkdir /data
mv /var/lib/mysql /data

cp /etc/my.cnf /etc/my.cnf.bak

# ================以下为my.cnf配置内容============由tools.percona.com生成=========================================================================
# Generated by Percona Configuration Wizard (http://tools.percona.com/) version REL5-20120208
# Configuration name mytest01 generated for 888888888@qq.com at 2016-01-06 14:26:02

[mysql]

# CLIENT #
port                           = 3306
socket                         = /data/mysql/mysql.sock

[mysqld]

# GENERAL #
user                           = mysql
default-storage-engine         = InnoDB
socket                         = /data/mysql/mysql.sock
pid-file                       = /data/mysql/mysql.pid

# MyISAM #
key-buffer-size                = 32M
myisam-recover                 = FORCE,BACKUP

# SAFETY #
max-allowed-packet             = 16M
max-connect-errors             = 1000000
skip-name-resolve
sql-mode                       = STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_AUTO_VALUE_ON_ZERO,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE,ONLY_FULL_GROUP_BY
sysdate-is-now                 = 1
innodb                         = FORCE

# DATA STORAGE #
datadir                        = /data/mysql/

# BINARY LOGGING #
log-bin                        = /data/mysql/mysql-bin
expire-logs-days               = 14
sync-binlog                    = 1

# CACHES AND LIMITS #
tmp-table-size                 = 32M
max-heap-table-size            = 32M
query-cache-type               = 0
query-cache-size               = 0
max-connections                = 500
thread-cache-size              = 50
open-files-limit               = 65535
table-definition-cache         = 1024
table-open-cache               = 2048

# INNODB #
innodb-flush-method            = O_DIRECT
innodb-log-files-in-group      = 2
innodb-log-file-size           = 128M
innodb-flush-log-at-trx-commit = 1
innodb-file-per-table          = 1
innodb-buffer-pool-size        = 1456M

# LOGGING #
log-error                      = /data/mysql/mysql-error.log
log-queries-not-using-indexes  = 1
slow-query-log                 = 1
slow-query-log-file            = /data/mysql/mysql-slow.log
