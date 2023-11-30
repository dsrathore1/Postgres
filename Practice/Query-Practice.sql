-- Active: 1701163633093@@localhost@5432@test

--! Importing UUID module

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE
    IF NOT EXISTS FUNCTION_QUERY(
        FULL_NAME VARCHAR(50) NOT NULL,
        DOB DATE,
        EMAIL_ID VARCHAR(90),
        JOINING TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

ALTER TABLE FUNCTION_QUERY
ADD
    CONSTRAINT UNIQUE_EMAIL_ID UNIQUE (EMAIL_ID);

ALTER TABLE FUNCTION_QUERY ALTER COLUMN EMAIL_ID SET NOT NULL;

--* ALTER TABLE FUNCTION_QUERY DROP CONSTRAINT EMAIL_ID;

ALTER TABLE FUNCTION_QUERY
ALTER COLUMN
    FULL_NAME TYPE VARCHAR(50),
ALTER COLUMN
    EMAIL_ID TYPE VARCHAR(90);

--! Inserting a data into table

INSERT INTO
    FUNCTION_QUERY (
        FULL_NAME,
        DOB,
        EMAIL_ID,
        JOINING
    )
VALUES (
        'DIGPAL SINGH RATHORE',
        '2003-02-26',
        'dsrathorebsw1234@gmail.com',
        DEFAULT
    );

SELECT * FROM FUNCTION_QUERY;

ALTER TABLE FUNCTION_QUERY
ALTER COLUMN JOINING
SET DEFAULT CURRENT_TIMESTAMP;

DELETE FROM FUNCTION_QUERY
WHERE EMAIL_ID = 'dsrathorebsw123@gmail.com'

UPDATE FUNCTION_QUERY
SET
    FULL_NAME = 'Digpal Singh Rathore'
WHERE DOB = '2003-02-26';

ALTER TABLE FUNCTION_QUERY DROP COLUMN ID;

CREATE TABLE EMPLOYEE AS TABLE FUNCTION_QUERY WITH NO DATA;

DROP TABLE FUNCTION_QUERY;

SELECT * FROM EMPLOYEE;