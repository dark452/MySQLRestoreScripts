#! /bin/bash
########################
# backup script for all users and privileges MySQL
# RH 2019 - imunoz@redeshost.cl
########################

TIMESTAMP=$(date +"%F")
BACKUP_DIR="/root/backups/"
MYSQL_USER="root"
MYSQL_PASSWORD="example"


getUsers_command="SELECT CONCAT('SHOW GRANTS FOR ''',user,'''@''',host,''';') AS query FROM mysql.user WHERE user NOT IN ('root','pma','phpmyadmin','debian-sys-maint')"


mysql -u$MYSQL_USER -p$MYSQL_PASSWORD  --skip-column-names -A -e "$getUsers_command" | mysql -u$MYSQL_USER -p$MYSQL_PASSWORD --skip-column-names -A | sed 's/$/;/g' > $BACKUP_DIR/MySQLUserGrants.$TIMESTAMP.sql
