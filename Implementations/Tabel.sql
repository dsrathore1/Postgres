-- Active: 1701339322028@@127.0.0.1@5432@postgres

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

--! Students Table operations

CREATE TABLE
    IF NOT EXISTS STUDENTS(
        USRID UUID DEFAULT uuid_generate_v4(),
        ID SERIAL PRIMARY KEY,
        NAME VARCHAR(50) NOT NULL,
        AGE INT NOT NULL,
        DOB DATE,
        EMAIL_ID VARCHAR(90) UNIQUE NOT NULL,
        INSERTED_DATA_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

INSERT INTO
    STUDENTS(NAME, AGE, DOB, EMAIL_ID)
VALUES (
        'JOE',
        12,
        '2015-12-09',
        'joe12@gmail.com'
    ), (
        'LAM',
        13,
        '2013-02-12',
        'lam12@gmail.com'
    ), (
        'NIL',
        14,
        '2014-12-05',
        'nil132@gmail.com'
    );

SELECT * FROM STUDENTS;

--! Categories table operations

CREATE TABLE
    IF NOT EXISTS CATEGORIES (
        category_id SERIAL NOT NULL PRIMARY KEY,
        category_name VARCHAR(255) NOT NULL UNIQUE,
        description TEXT []
    );

INSERT INTO
    categories (category_name, description)
VALUES (
        'Condiments',
        ARRAY ['Sweet and savory sauces, relishes, spreads,seasonings']
    ), (
        'Confections',
        ARRAY ['Desserts, candies, and sweet breads']
    ), (
        'Dairy Products',
        ARRAY ['Cheeses']
    ), (
        'Grains/Cereals',
        ARRAY ['Breads, crackers, pasta, and cereal']
    ), (
        'Meat/Poultry',
        ARRAY ['Prepared meats']
    ), (
        'Produce',
        ARRAY ['Dried fruit and bean curd']
    ), (
        'Seafood',
        ARRAY ['Seaweed and fish']
    );

SELECT * FROM CATEGORIES

TRUNCATE TABLE CATEGORIES;

DROP TABLE CATEGORIES;

--! Test products table operations

CREATE TABLE
    TEST_PRODUCTS (
        testproduct_id SERIAL NOT NULL PRIMARY KEY,
        product_name VARCHAR(255) UNIQUE,
        category_id INT
    );

INSERT INTO
    TEST_PRODUCTS (product_name, category_id)
VALUES ('Johns Fruit Cake', 3), ('Marys Healthy Mix', 9), ('Peters Scary Stuff', 10), ('Jims Secret Recipe', 11), ('Elisabeths Best Apples', 12), ('Janes Favorite Cheese', 4), ('Billys Home Made Pizza', 13), ('Ellas Special Salmon', 8), ('Roberts Rich Spaghetti', 5), ('Mias Popular Ice', 14);

SELECT TESTPRODUCT_ID, CATEGORY_ID, PRODUCT_NAME FROM TEST_PRODUCTS;