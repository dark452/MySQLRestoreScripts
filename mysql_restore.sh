#! /bin/bash
########################
# restore script for all MySQL databases
# from a bz2 file
# RH 2019 - imunoz@redeshost.cl
########################


BACKUP_DIR="/root/backups/"
MYSQL_USER="root"
MYSQL_PASSWORD="example"
#MYSQLDUMP=/usr/bin/mysqldump


databases=`cd $BACKUP_DIR; ls -d */ | grep -Ev "(migrate|mysql)" | awk -F"/" '{print $1}'`

for db in $databases; do
  echo "Restoring.... $db"
  last_backup=`ls -t $db/ | head -n1`
  mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $db;"
  bunzip2 < $db/$last_backup | mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $db 
  done

  echo "Finish!"
