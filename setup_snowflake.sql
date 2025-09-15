/* CREATING ENVIRONMENT */

USE ROLE accountadmin;

CREATE WAREHOUSE dbt_wh WITH warehouse_size = 'x-small' auto_suspend = 300 auto_resume = True;

CREATE DATABASE IF NOT EXISTS dbt_db;

CREATE ROLE IF NOT EXISTS dbt_role;

SHOW GRANTS ON WAREHOUSE dbt_wh;

GRANT USAGE ON WAREHOUSE dbt_wh TO ROLE dbt_role;

SHOW GRANTS ON WAREHOUSE dbt_wh;

GRANT ROLE dbt_role TO USER CAROLDVARELA; /* SET YOUR USER */

GRANT ALL ON DATABASE dbt_db TO ROLE dbt_role;

USE ROLE dbt_role;

/* CREATING TABLES */

CREATE SCHEMA dbt_db.raw;

CREATE SCHEMA dbt_db.dbt_schema;

CREATE OR REPLACE TABLE dbt_db.raw.brands (
    brand_id INTEGER,
    brand_name STRING
);

CREATE OR REPLACE TABLE dbt_db.raw.categories (
    category_id INTEGER,
    category_name STRING
);

CREATE OR REPLACE TABLE dbt_db.raw.customers (
    customer_id INTEGER,
    first_name STRING,
    last_name STRING,
    phone STRING,
    email STRING,
    street STRING,
    city STRING,
    state STRING,
    zip_code STRING
);

CREATE OR REPLACE TABLE dbt_db.raw.order_items (
    order_id INTEGER,
    item_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    list_price NUMBER,
    discount FLOAT
);

CREATE OR REPLACE TABLE dbt_db.raw.orders (
    order_id INTEGER,
    customer_id INTEGER,
    order_status INTEGER,
    order_date DATE,
    required_date DATE,
    shipped_date VARCHAR,
    store_id INTEGER,
    staff_id INTEGER
);

CREATE OR REPLACE TABLE dbt_db.raw.products (
    product_id INTEGER,
    product_name STRING,
    brand_id INTEGER,
    category_id INTEGER,
    model_year INTEGER,
    list_price NUMBER
);

CREATE OR REPLACE TABLE dbt_db.raw.staffs (
    staff_id INTEGER,
    first_name STRING,
    last_name STRING,
    email STRING,
    phone STRING,
    active INTEGER,
    store_id INTEGER,
    manager_id VARCHAR
);


CREATE OR REPLACE TABLE dbt_db.raw.stores (
    store_id INTEGER,
    store_name STRING,
    phone STRING,
    email STRING,
    street STRING,
    city STRING,
    state STRING,
    zip_code STRING
);

CREATE OR REPLACE TABLE dbt_db.raw.stocks (
    store_id INTEGER,
    product_id INTEGER,
    quantity INTEGER
);


/* FINAL CLEANING OF THE ENVIRONMENT */

USE ROLE accountadmin;

DROP WAREHOUSE IF EXISTS dbt_wh;

DROP DATABASE IF EXISTS dbt_db;

DROP ROLE IF EXISTS dbt_role;