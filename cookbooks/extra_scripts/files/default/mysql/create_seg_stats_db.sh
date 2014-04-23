#!/bin/bash

MYSQL=`which mysql`
 
Q1="CREATE DATABASE IF NOT EXISTS segment_stats;"
Q2="GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP on segment_stats.* TO 'adtarget'@'localhost' IDENTIFIED BY 'adtarget';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"
  
$MYSQL -uroot -pcicd -e "$SQL"

$MYSQL -uadtarget -padtarget < segStats/segment_stats_Create_audience_stats.sql

$MYSQL -uadtarget -padtarget < segStats/segment_stats_Create_audience_uts_stats.sql
