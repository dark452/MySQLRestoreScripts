# MySQLRestoreScripts
Pieces to be able to restore a MySQL database

## MySQL Restore

### Dependencies
* bzip2

The **mysql_restore.sh** script, iterates across the backup folder that you can specify, read all the files and create the database, then restore the lastest bz2 file per database that find in that folder. 

### Parameters
BACKUP_DIR="THE FOLDER WHERE THE ACTUAL BACKUPS ARE STORED"
MYSQL_USER="BACKUP USER"
MYSQL_PASSWORD="PASSWORD OF THE ABOVE USER"



## MySQL User privileges backup

The **users_privileges_backup.sh** script, allows you to get a .sql file with all the users privileges granted in the databases.
You can easy run the .sql file to restore all the users privileges.

### Parameters
TIMESTAMP=$(date +"%F") **The timestamp for the .sql file created**
BACKUP_DIR="THE FOLDER WHERE THE ACTUAL BACKUPS ARE STORED"
MYSQL_USER="BACKUP USER"
MYSQL_PASSWORD="PASSWORD OF THE ABOVE USER"

An example of the output:

``GRANT SELECT, RELOAD, SHOW DATABASES, LOCK TABLES, SHOW VIEW ON *.* TO 'BACKUPUSER'@'%' IDENTIFIED BY PASSWORD '*3D02EDE29CDA266AC901C6B009F962E6B885269F';``

``GRANT ALL PRIVILEGES ON *.* TO 'databaseXXX'@'%' IDENTIFIED BY PASSWORD '*8C5A894B3A937544BD13FA25A1D8FC69AD994424';``

``GRANT ALL PRIVILEGES ON `databaseXXX`.* TO 'learning'@'%';``

``GRANT USAGE ON *.* TO ''@'localhost';``

``GRANT SELECT, RELOAD, SHOW DATABASES, LOCK TABLES, SHOW VIEW ON *.* TO 'BACKUPUSER'@'localhost' IDENTIFIED BY PASSWORD '*3D02EDE29CDA266AC901C6B009F962E6B885269F';``

``GRANT PROCESS, REPLICATION CLIENT ON *.* TO 'telegraf'@'localhost' IDENTIFIED BY PASSWORD '*EB0F5F14AB92E0BB82F5135D7B72E2210DD83390';``

``GRANT SELECT ON `performance\\_schema`.* TO 'telegraf'@'localhost';``

``GRANT SELECT ON `information\\_schema`.* TO 'telegraf'@'localhost';``

``GRANT SELECT ON `cluster\\_replication`.* TO 'telegraf'@'localhost';``


### Crontab
This script should be executed everyday

##mysql user privileges dump
0 22 * * * /var/www/scripts/users_privileges_backup.sh > /var/www/backup/logs/users_privileges_backup_`date +'\%FT\%T'`.log 2>&1
