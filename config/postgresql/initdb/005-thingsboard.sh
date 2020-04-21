#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    create role thingsboard with login password 'thingsboard-passwd';
    create database thingsboard with owner thingsboard;
EOSQL
