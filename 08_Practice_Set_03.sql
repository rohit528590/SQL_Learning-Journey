-- Create the database only if it does not already exist
CREATE DATABASE IF NOT EXISTS sql_practice03_db;

-- Switch to the target database
-- NOTE: database name must match exactly (ApnaCollege ≠ ApnaCollge)
USE sql_practice03_db;

--------------------------------------------------
-- TABLE DEFINITION
--------------------------------------------------
/*
Table: Payment_List
Purpose:
Store customer payment records categorized by payment method.
*/
CREATE TABLE IF NOT EXISTS Payment_List (
    customer_id INT PRIMARY KEY,   -- Unique identifier for each customer
    customer    VARCHAR(50),       -- Customer full name
    mode        VARCHAR(50),       -- Payment method used
    city        VARCHAR(50)        -- Customer city
);

--------------------------------------------------
-- DATA INSERTION
--------------------------------------------------
/*
Insert sample payment records for aggregation practice.
*/
INSERT INTO Payment_List (customer_id, customer, mode, city) VALUES
(101, 'Olivia Barrett', 'Netbanking', 'Portland'),
(102, 'Ethan Sinclair', 'Credit Card', 'Miami'),
(103, 'Maya Hernandez', 'Credit Card', 'Seattle'),
(104, 'Liam Donovan', 'Netbanking', 'Denver'),
(105, 'Sophia Nguyen', 'Credit Card', 'New Orleans'),
(106, 'Caleb Foster', 'Debit Card', 'Minneapolis'),
(107, 'Ava Patel', 'Debit Card', 'Phoenix'),
(108, 'Lucas Carter', 'Netbanking', 'Boston'),
(109, 'Isabella Martinez', 'Netbanking', 'Nashville'),
(110, 'Jackson Brooks', 'Credit Card', 'Boston');

-- Verify inserted records
SELECT * FROM Payment_List;

--------------------------------------------------
-- AGGREGATION BY PAYMENT METHOD
--------------------------------------------------
/*
Count how many payments were made using each payment mode.
GROUP BY mode groups records by payment method.
COUNT(customer_id) counts transactions per group.
*/
SELECT mode, COUNT(customer_id) AS total_payments
FROM Payment_List
GROUP BY mode;

--------------------------------------------------
-- ORDERING AGGREGATED RESULTS
--------------------------------------------------
/*
Sort payment methods by number of transactions.
*/

-- Ascending order (lowest usage first)
SELECT mode, COUNT(customer_id) AS total_payments
FROM Payment_List
GROUP BY mode
ORDER BY total_payments ASC;

-- Descending order (highest usage first)
SELECT mode, COUNT(customer_id) AS total_payments
FROM Payment_List
GROUP BY mode
ORDER BY total_payments DESC;