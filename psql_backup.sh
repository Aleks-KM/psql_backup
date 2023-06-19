#!/usr/bin/env bash

DATE=`date +%F_%H.%M`
DIR="/backup"
a=(db1 db2 db3)

for DB in ${a[@]} 
do 
    pg_dump -U postgres -w $DB | gzip > $DIR/$DB'_'$DATE.gz
    find $DIR -type f -mtime +30 -delete
done
