#!/bin/bash

#check vars
if [ -z "$LIQUIBASE_CHANGELOGFILE" ]
then
  echo "\$LIQUIBASE_CHANGELOGFILE is empty.Exit"
  exit 1
fi

if [ -z "$DB_HOST" ]
then
  echo "\$DB_HOST is empty.Exit"
  exit 1
fi

if [ -z "$DB_DB" ]
then
  echo "\$DB_HOST is empty.Exit"
  exit 1
fi

if [ -z "$DB_PORT" ]
then
  echo "\$DB_PORT is empty.Exit"
  exit 1
fi

if [ -z "$DB_USER" ]
then
  echo "\$DB_USER is empty.Exit"
  exit 1
fi

if [ -z "$DB_PASS" ]
then
  echo "\$DB_PASS is empty.Exit"
  exit 1
fi

/usr/local/bin/liquibase --classpath=${LIQUIBASE_CLASSPATH} --changeLogFile=${LIQUIBASE_CHANGELOGFILE} --url="jdbc:POSTGRESQL://${DB_HOST}:${DB_PORT}/${DB_DB}" --username=${DB_USER} --password=${DB_PASS} $@