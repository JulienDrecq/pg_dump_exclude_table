**Simple bash for exclude certain data tables (keeping schema)**

Start & Exemple
-----------

1. Add execution mode on the file ``pg_dump_exclude_table.sh``:

  ``chmod +x pg_dump_exclude_table.sh``

2. Run command
    
  ``./pg_dump_exclude_table.sh test_db res_users res_company``
    - dbname: ``test_db``
    - exclude_table: ``res_users res_company``
    - output: ``test_db_DATE.sql.gz``
