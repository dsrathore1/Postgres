-- Active: 1701255000176@@127.0.0.1@5432@implement

--* Creating a new database
CREATE DATABASE implement2;

-- * List all databases
SELECT * FROM pg_database;

-- * This will only gives all the name of database which are already exists
SELECT datname from pg_database;

-- * If any database is not able to delete because, it's connection with other users
DROP DATABASE implement2 WITH (FORCE);
