create database store_management;
use store_management;

create table governorates( 
id int AUTO_INCREMENT primary Key,
name varchar(50) NOT NULL
);

CREATE TABLE stores(
id int AUTO_INCREMENT Primary key,
name varchar(50) not null,
address varchar(50) not null
);

ALTER TABLE stores
ADD COLUMN governorates_id INT,
ADD CONSTRAINT FK_STORES_GOVERNORATES 
FOREIGN key (governorates_id) References governorates(id) 
ON DELETE CASCADE;

CREATE TABLE suppliers(
id int AUTO_INCREMENT Primary key,
name varchar(50) not null,
phone varchar(50),
email varchar(50),
brief_data varchar(255)
);

CREATE TABLE products(
id int AUTO_INCREMENT Primary key,
name varchar(50) not null,
code varchar(50) UNIQUE,
price varchar(50),
description varchar(255)
);

ALTER TABLE products
ADD COLUMN suppliers_id INT,
ADD CONSTRAINT FK_PRODUCTS_SUPPLIERS 
FOREIGN key (suppliers_id) references suppliers(id) 
ON DELETE CASCADE;

CREATE TABLE store_products(
id int AUTO_INCREMENT Primary key
);

ALTER TABLE store_products
ADD COLUMN stores_id INT,
ADD COLUMN products_id INT,
ADD CONSTRAINT FK_Store_Products_Stores 
FOREIGN KEY(stores_id) REFERENCES stores(id) 
ON DELETE CASCADE ,
ADD CONSTRAINT FK_Store_Products_Products 
FOREIGN KEY(products_id) REFERENCES products(id) 
ON DELETE CASCADE;

-- from “orderdetails” table. Write a query to get all order numbers (without repetition) that contain any product starting with code S18 and price more than 100.
SELECT DISTINCT order_number from orderdetails where code like 'S18%' AND price > 100;

-- from “payments” table. Write a query to get all payments that were made on day 5 or 6 (whatever month or year).
SELECT * from payments where DAY(order_date) IN (5,6);

-- from “customers” table. Write a query to get the fifth-highest credit limit of the customers who (live in the USA and their phone number contains 5555)
select max(credit_limit) from customers where country = 'USA' and phone like '%5555%';