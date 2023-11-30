
--! Create new database

CREATE DATABASE LEARN;

--! Drop database

DROP DATABASE LEARN;

--! Create a USER only with name

CREATE USER KING;

--! Create new database by adding owner

CREATE DATABASE POST OWNER KING;

--! Create an Table

CREATE TABLE
    IF NOT EXISTS PERSON (
        SR_NO INT PRIMARY KEY,
        FIRST_NAME VARCHAR(50) NOT NULL,
        LAST_NAME VARCHAR(90) NOT NULL,
        GENDER CHAR(1),
        BIRTH_DATE DATE,
        EMAIL_ID VARCHAR(100) UNIQUE
    );

--! Create temporary table for the database's session in. When database's session finish it will disappear form DATABASE

CREATE TEMP TABLE IF NOT EXISTS TEMP_TABLE(
    ID INT,
    T_FIRSTNAME VARCHAR(30) NOT NULL,
    T_LASTNAME VARCHAR(40)
);

--! Drop Table CMD. This command will drop the table if it exists, this is a good practice to write exists keyword into creation.

DROP TABLE person;

--! Create table and get an reference from table PERSON with SELECT command

CREATE TABLE IF NOT EXISTS EMPLOYEE AS SELECT * FROM person;

--! Create own composite data type

CREATE TYPE
    ADDRESS AS(
        STREET VARCHAR(100),
        _STATE CHAR (2),
        ZIP VARCHAR(10)
    );

--! Create own data type that comprise a static values, it can be anything but same data type

CREATE TYPE
    week AS ENUM(
        'MON',
        'TUE',
        'WED',
        'THU',
        'FRI',
        'SAT',
        'SUN'
    );

SELECT UNNEST(enum_range(null::week)) AS week;

drop type week

--! Install UUID module which will store in functions

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

--! Creating table by using most common used DATA TYPES

CREATE TABLE
    IF NOT EXISTS ALL_DATA_TYPES (
        USER_ID UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
        -- *This UUID generate random alphanumeric combinations
        FULL_NAME VARCHAR(90) NOT NULL,
        SALARY NUMERIC(10, 2),
        -- *NUMERIC(PRECISION_VALUE_BEFORE_POINT, DECIMAL_VALUES_AFTER_POINT )
        ABOUT TEXT,
        DOB DATE NOT NULL,
        _ADDRESS ADDRESS,
        HOBBIES TEXT [3]
    );

--! Inserting the data into employee table

INSERT INTO
    EMPLOYEE (
        SR_NO,
        FIRST_NAME,
        LAST_NAME,
        GENDER,
        BIRTH_DATE,
        EMAIL_ID
    )
VALUES (
        101,
        'JOHN',
        'DOE',
        'M',
        '2003-02-12',
        'TEST@GMAIL.COM'
    ), (
        102,
        'MARIE',
        'WAL',
        'F',
        '2000-03-13',
        'test2@gmail.com'
    ), (
        103,
        'ROBBIN',
        'LOBO',
        'M',
        '1997-05-20',
        'TEST3@GMAIL.COM'
    );

--! Getting an all inserted data in a table.

SELECT * FROM EMPLOYEE;

--! It will delete all the row/tuples from the table

TRUNCATE TABLE EMPLOYEE;

--! Deleting an SPECIFIC data from the table

DELETE FROM EMPLOYEE WHERE SR_NO = 103

--! Manipulate/Alter in employee table by adding UNIQUE constraint into two columns

ALTER TABLE EMPLOYEE ADD UNIQUE(EMAIL_ID, SR_NO);

--! Manipulate/Alter in employee table by adding NOT NULL constraint into two columns

ALTER TABLE EMPLOYEE
ALTER COLUMN FIRST_NAME
SET NOT NULL,
ALTER COLUMN LAST_NAME
SET NOT NULL;

--! Manipulate/Alter in employee table by adding PRIMARY KEY constraint into SR_NO column

ALTER TABLE EMPLOYEE ADD PRIMARY KEY (SR_NO);