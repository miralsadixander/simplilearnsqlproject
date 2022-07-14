CREATE DATABASE sqlbasics;

USE sqlbasics;

-- 1. Creating tables with fields and setting data types in each:

CREATE TABLE product_table (
product_code varchar(45) NOT NULL,
product_name varchar(45) NOT NULL,
price int NOT NULL,
stock varchar(45) NOT NULL,
category varchar(45) NOT NULL,
PRIMARY KEY (product_code)
);

CREATE TABLE customer_table (
customer_id varchar(45) NOT NULL,
customer_name varchar(45) NOT NULL,
customer_location varchar(45) NOT NULL,
customer_phone_no int NOT NULL,
PRIMARY KEY (customer_id)
);

CREATE TABLE sales_table (
order_date DATE NOT NULL,
order_no varchar(45) NOT NULL,
customer_id int NOT NULL,
customer_name varchar(45) NOT NULL,
product_code varchar(45) NOT NULL,
product_name varchar(45) NOT NULL,
quantity int NOT NULL,
price float NOT NULL,
PRIMARY KEY (order_date)
);

-- 2. Inserting values manually in each table:

INSERT INTO customer_table (customer_id, customer_name, customer_location, customer_phone_no)
	VALUES ('9212', 'Jessica', 'Banglore', '1233435');
    
INSERT INTO sales_table (order_date, order_no, customer_id, customer_name, product_code, product_name, quantity, price)
	VALUES ('2021-02-12', 'HM02', '2123', 'Biyush', '03', 'Pen', '2', '20');
    
INSERT INTO product_table (product_code, product_name, price, stock, category)
	VALUES ('07', 'Shampoo', '5', '90', 'Hair Product');
    
-- 3. Query to add new columns, e.g. serial numbers or categories, to the sales table:

ALTER TABLE sales_table
ADD (serial_no int, categories varchar(45));

-- 4. Query to change the field type for stock to varchar in product table:
ALTER TABLE product_table
MODIFY stock varchar(45);

-- 5. Query to change the table name from customer_table to customer_details:
ALTER TABLE customer_table
RENAME TO customer_details;

-- 6. Query to drop columns that were added in Q. 3:
ALTER TABLE sales_table DROP COLUMN serial_no;

ALTER TABLE sales_table DROP COLUMN categories;

/* Datasets imported using tool */

-- 7. Query to display details of a product where the category is 'stationary':
SELECT * FROM product_table
WHERE category = "stationary";

-- 8. Query to display unique category from product table:
SELECT DISTINCT (category) FROM product_table;

-- 9. Query to display the details of sales from sales table where quantity is greater than 2 and price is less than 500:
SELECT * FROM sales_table
WHERE quantity >2
AND price <500;

-- 10. Query to display customer names where their names ends in 'a':
SELECT * FROM customer_details
WHERE customer_name LIKE '%a';

-- 11. Query to display product details in descending order of price:
SELECT * FROM product_table
ORDER by price desc;

-- 12. Query to display product code and category from categories containing two or more products:
SELECT product_code, category FROM product_table
GROUP BY category
HAVING COUNT(category) >=2;

-- 13. Query to combine the sales and product tables based on order number and customer's name, inc ducplicated rows:
SELECT order_no, customer_name FROM sales_table
LEFT JOIN product_table ON sales_table.product_code = product_table.product_code
UNION ALL
SELECT order_no, customer_name FROM sales_table
RIGHT JOIN product_table ON sales_table.product_code = product_table.product_code;

/* END */

SELECT * FROM sales_table;
