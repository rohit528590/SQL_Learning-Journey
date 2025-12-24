-- Create a dedicated database for practicing SQL constraints
CREATE DATABASE IF NOT EXISTS constraints_practice;

-- Set the active database context
USE constraints_practice;

--------------------------------------------------
-- CONSTRAINTS OVERVIEW
--------------------------------------------------
/*
SQL constraints enforce rules on table data.
They protect data integrity by preventing invalid inserts or updates.
*/

--------------------------------------------------
-- COMMONLY USED CONSTRAINTS
--------------------------------------------------
/*
NOT NULL     : Column must always have a value
UNIQUE       : All values in the column must be distinct
PRIMARY KEY  : Combines UNIQUE + NOT NULL (one per table)
DEFAULT      : Assigns a value when none is provided
CHECK        : Restricts values based on a condition
*/

--------------------------------------------------
-- DEFAULT + PRIMARY KEY CONSTRAINT
--------------------------------------------------
/*
Table: emp
- id is the primary key (unique and not null)
- salary defaults to 50000 if not explicitly provided
*/
CREATE TABLE emp (
    id INT,
    name VARCHAR(50),
    salary INT DEFAULT 50000,     -- Automatically assigned when salary is omitted
    PRIMARY KEY (id)              -- Ensures unique employee identification
);

-- Insert records without specifying salary (DEFAULT applies)
INSERT INTO emp (id, name)
VALUES (1, "Rohit"), (2, "Shubham"), (3, "Ravi");

-- View all employee records
SELECT * FROM emp;

-- Insert records with explicitly defined salary
INSERT INTO emp (id, name, salary)
VALUES (4, "Abhishek", 30000), (5, "Saniya", 45000);

SELECT * FROM emp;

--------------------------------------------------
-- UNIQUE + COMPOSITE PRIMARY KEY
--------------------------------------------------
/*
Table: temp1
- id is UNIQUE individually
- (id, name) together form a composite PRIMARY KEY
- Same id OR same name may exist
- The combination of id + name must be unique and not NULL
*/
CREATE TABLE IF NOT EXISTS temp1 (
    id INT UNIQUE,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    PRIMARY KEY (id, name)
);

-- Insert valid records (composite key remains unique)
INSERT INTO temp1 (id, name)
VALUES (101, "Shyam"), (102, "Ram");

SELECT id, name FROM temp1;

-- Valid because id + name combination is still unique
INSERT INTO temp1 (id, name)
VALUES (103, "Ram"),(104, "Shyam");

SELECT * FROM temp1;

--------------------------------------------------
-- CHECK CONSTRAINT (COLUMN + TABLE LEVEL)
--------------------------------------------------
/*
Table: newTab
- Age must be 18 or older
- Only rows with Name = 'Rohit' AND City = 'Delhi' are allowed
*/
CREATE TABLE newTab (
    Name VARCHAR(50),
    Age INT CHECK (Age >= 18),     -- Column-level CHECK
    City VARCHAR(50),
    CONSTRAINT chk_name_city CHECK (Name = "Rohit" AND City = "Delhi")
);

--------------------------------------------------
-- CHECK CONSTRAINT WITH MULTIPLE CONDITIONS
--------------------------------------------------
/*
Table: User
- Age must be 18 or above
- City must be Delhi
- Condition enforced at table level
*/
CREATE TABLE User (
    name VARCHAR(50),
    city VARCHAR(50),
    age INT,
    CONSTRAINT age_check CHECK (age >= 18 AND city = "Delhi")
);

-- View all tables in the current database
SHOW TABLES;