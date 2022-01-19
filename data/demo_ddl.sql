SET client_min_messages TO WARNING;

DROP SCHEMA IF EXISTS demo CASCADE;
CREATE SCHEMA demo;

-- categories
DROP TABLE IF EXISTS demo.categories;
CREATE TABLE demo.categories
(
    category_id   SMALLINT PRIMARY KEY,
    category_name TEXT,
    description   TEXT
);
COPY demo.categories (category_id, category_name, description) FROM '/data/categories.csv' DELIMITER ';' CSV HEADER;

-- shippers
DROP TABLE IF EXISTS demo.shippers;
CREATE TABLE demo.shippers
(
    shipper_id   SMALLINT PRIMARY KEY,
    shipper_name TEXT,
    phone        TEXT
);
COPY demo.shippers (shipper_id, shipper_name, phone) FROM '/data/shippers.csv' DELIMITER ';' CSV HEADER;

-- employees
DROP TABLE IF EXISTS demo.employees;
CREATE TABLE demo.employees
(
    employee_id SMALLINT PRIMARY KEY,
    last_name   TEXT,
    first_name  TEXT,
    birth_day   DATE,
    photo       TEXT,
    notes       TEXT
);
COPY demo.employees (employee_id, last_name, first_name, birth_day, photo, notes) FROM '/data/employees.csv' DELIMITER ';' CSV HEADER;

-- suppliers
DROP TABLE IF EXISTS demo.suppliers;
CREATE TABLE demo.suppliers
(
    supplier_id   SMALLINT PRIMARY KEY,
    supplier_name TEXT,
    contact_name  TEXT,
    address       TEXT,
    city          TEXT,
    postal_code   TEXT,
    country       TEXT,
    phone         TEXT
);
COPY demo.suppliers (supplier_id, supplier_name, contact_name, address, city, postal_code, country, phone) FROM '/data/suppliers.csv' DELIMITER ';' CSV HEADER;

-- products
DROP TABLE IF EXISTS pdemo.roducts;
CREATE TABLE demo.products
(
    product_id   SMALLINT PRIMARY KEY,
    product_name TEXT,
    supplier_id  SMALLINT,
    category_id  SMALLINT,
    unit         TEXT,
    price        NUMERIC,
    CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES demo.suppliers(supplier_id),
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES demo.categories(category_id)
);
COPY demo.products (product_id, product_name, supplier_id, category_id, unit, price) FROM '/data/products.csv' DELIMITER ';' CSV HEADER;

-- customers
DROP TABLE IF EXISTS demo.customers;
CREATE TABLE demo.customers
(
    customer_id SMALLINT PRIMARY KEY,
    country     TEXT
);
COPY demo.customers (customer_id, country) FROM '/data/customers.csv' DELIMITER ';' CSV HEADER;

-- orders
DROP TABLE IF EXISTS demo.orders;
CREATE TABLE demo.orders
(
    order_id    SMALLINT PRIMARY KEY,
    customer_id SMALLINT,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES demo.customers(customer_id)
);
COPY demo.orders (order_id, customer_id) FROM '/data/orders.csv' DELIMITER ';' CSV HEADER;

-- order_details
DROP TABLE IF EXISTS demo.order_details;
CREATE TABLE demo.order_details
(
    order_detail_id SMALLINT PRIMARY KEY,
    order_id        SMALLINT,
    product_id      SMALLINT,
    quantity        INT,
    CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES demo.orders(order_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES demo.products(product_id)
);
COPY demo.order_details (order_detail_id, order_id, product_id, quantity) FROM '/data/order_details.csv' DELIMITER ';' CSV HEADER;