#!/bin/bash
## Exemple ##
# ./pg_dump_exclude_table.sh test_db res_users res_company
# dbname: test_db
# exclude_table: res_users res_company
# output: test_db_DATE.sql.gz

day=`LANG=C date +%Y%m%d_%H%M`
dbname=$1
for (( i=2; i<=$#; i++ )); do
    eval arg=\$$i
    exclude_table=`echo -n "$exclude_table -T $arg"`
done
pg_dump $exclude_table $dbname > "$dbname""_$day.sql"
for (( i=2; i<=$#; i++ )); do
    eval arg=\$$i
    pg_dump -s $dbname -t $arg >> "$dbname""_$day.sql"
done
gzip "$dbname""_$day.sql"
