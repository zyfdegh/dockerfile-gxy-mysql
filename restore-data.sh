#!/bin/sh

mysql -uroot -p$MYSQL_ROOT_PASSWORD -e source /mysql_dump.sql
