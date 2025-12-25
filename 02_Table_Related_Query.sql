-- Create the database only if it does not already exist
CREATE DATABASE IF NOT EXISTS sql_table_db;

-- Switch the current session to use the Rohit database
USE sql_table_db;

--------------------------------------------------
-- TABLE OPERATIONS (DDL + DML PRACTICE)
--------------------------------------------------

/*
Purpose:
Create a table with explicitly defined columns, data types,
and constraints to enforce data integrity.
*/
CREATE TABLE IF NOT EXISTS student (
    rollno INT PRIMARY KEY,     -- Unique identifier for each student (no duplicates, no NULLs)
    name   VARCHAR(100)         -- Student name with a reasonable character limit
);

--------------------------------------------------
-- DATA RETRIEVAL
--------------------------------------------------

/*
Purpose:
View all rows and all columns from the student table.
Useful for verifying inserts and debugging.
*/
SELECT * FROM student;

--------------------------------------------------
-- DATA INSERTION
--------------------------------------------------

/*
Method 1: Explicit column list
Best practice.
- Order of columns does NOT need to match table definition.
- Safer when table structure changes.
*/
INSERT INTO student (name, rollno)
VALUES
('Rohit', 1),
('Abhishek', 2),
('Ravi', 3),
('Shubham', 4);

SELECT * FROM student;

/*
Method 2: No column list
- Values MUST match the exact column order defined in the table.
- Risky in real projects, acceptable for learning/demo.
*/
INSERT INTO student
VALUES (10,'Aditya');

SELECT * FROM student;

/*
Multiple-row insert using default column order.
Efficient for bulk inserts when column order is known.
*/
INSERT INTO student VALUES (5, "Saniya"),(6, 'Raja'),(7, 'Golu');

-- Select the name column from the student table
SELECT name FROM student;

-- Insert multiple rows with explicit column mapping.
INSERT INTO student (name, rollno) VALUES ('Khushubo', 8),('Mukesh', 9);

SELECT * FROM student;