#!/bin/bash

while ! mysqladmin ping -h"$MYSQL_HOST" --silent; do
    echo "Esperando a que inicialize correctamente el MYSQL"
    sleep 2
done

echo "Mysql esta listo para ejecutarse y exportar su data"


# bucle para obtener la data

while true; do
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOST" "$MYSQL_DATABASE" > /backup/db_backup_"$TIMESTAMP".sql
    echo "Backup finalizado db_backup_$TIMESTAMP.sql"
    sleep $BACKUP_INTERVAL
done