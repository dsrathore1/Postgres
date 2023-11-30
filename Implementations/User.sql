-- Active: 1701163633093@@localhost@5432@implement
--* Creating a new user with password

CREATE USER KING2
WITH
    REPLICATION CREATEDB SUPERUSER VALID UNTIL '2023-11-30' PASSWORD '1234';

--* List all users

SELECT * FROM pg_catalog.pg_user;

--* List specific user with user name

SELECT * FROM pg_catalog.pg_user where usename = 'dsr';

--* Creating a user
CREATE USER KING3
WITH
    REPLICATION NOCREATEDB PASSWORD '1212' NOINHERIT VALID UNTIL '2023-11-30';

-- ! NOTE :- Every user will get all the databases from superuser


GRANT KING TO DSR;

DROP OWNED by KING;

DROP ROLE KING;

GRANT ALL PRIVILEGES ON DATABASE IMPLEMENT TO KING;