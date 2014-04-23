#!/bin/bash

MYSQL=`which mysql`
 
Q1="CREATE DATABASE IF NOT EXISTS asms;"
Q2="GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP on asms.* TO 'asms'@'localhost' IDENTIFIED BY 'asms';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"
  
$MYSQL -uroot -pcicd -e "$SQL"

$MYSQL -uasms -pasms < asms/asms_Create_table.partners.sql
$MYSQL -uasms -pasms < asms/asms_Create_table.providers.sql
$MYSQL -uasms -pasms < asms/asms_Create_table.whitelist.sql

$MYSQL -uasms -pasms < asms/asms_insert_into_partners.sql
$MYSQL -uasms -pasms < asms/asms_insert_into_providers.sql
$MYSQL -uasms -pasms < asms/asms_insert_into_whitelist.sql
