-- Create database if it does not already exist
CREATE DATABASE IF NOT EXISTS sql_functions_groupClause_db;

-- Use the database for all subsequent queries
USE sql_functions_groupClause_db;

--------------------------------------------------
-- TABLE DEFINITION
--------------------------------------------------
/*
Table: student
Purpose:
Store academic performance and basic demographic data.
*/
CREATE TABLE IF NOT EXISTS student (
    rollno INT PRIMARY KEY,     -- Unique identifier for each student
    name   VARCHAR(50),         -- Student name
    marks  INT NOT NULL,        -- Marks must always be present
    grade  VARCHAR(1),          -- Single-character grade
    city   VARCHAR(20)          -- City associated with the student
);

--------------------------------------------------
-- DATA INSERTION
--------------------------------------------------
/*
Insert sample records for aggregation and grouping practice.
*/
INSERT INTO student (rollno, name, marks, grade, city) VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhrub", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

--------------------------------------------------
-- AGGREGATE FUNCTIONS
--------------------------------------------------
/*
Aggregate functions operate on multiple rows
and return a single summarized value.
*/

-- COUNT(): total number of non-NULL roll numbers
SELECT COUNT(rollno) FROM student;

-- MAX(): highest marks obtained
SELECT MAX(marks) FROM student;

-- MIN(): lowest marks obtained
SELECT MIN(marks) FROM student;

-- SUM(): total of all marks
SELECT SUM(marks) FROM student;

-- AVG(): average marks across all students
SELECT AVG(marks) FROM student;

--------------------------------------------------
-- GROUP BY CLAUSE
--------------------------------------------------
/*
GROUP BY groups rows sharing the same column value.
Typically used with aggregate functions.
*/

-- Unique list of cities (grouping without aggregation)
SELECT city FROM student GROUP BY city;

-- Grouping by multiple columns
SELECT city, name FROM student GROUP BY city, name;

-- Count students per city
SELECT city, COUNT(rollno)
FROM student
GROUP BY city;

-- Count students per grade (sorted alphabetically)
SELECT grade, COUNT(rollno)
FROM student
GROUP BY grade
ORDER BY grade;

--------------------------------------------------
-- GROUP BY WITH AGGREGATION
--------------------------------------------------

/*
Most real-world GROUP BY queries involve aggregation.
*/

-- Average marks per city
SELECT city, AVG(marks)
FROM student
GROUP BY city;

-- Maximum marks per city (sorted by city name)
SELECT city, MAX(marks)
FROM student
GROUP BY city
ORDER BY city;

-- Maximum marks per city (sorted by highest score)
SELECT city, MAX(marks)
FROM student
GROUP BY city
ORDER BY MAX(marks) DESC;

--------------------------------------------------
-- ORDERING GROUPED RESULTS
--------------------------------------------------
/*
Sorting grouped data by either group key or aggregated value.
*/

-- Average marks per city (sorted by city name ascending)
SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY city ASC;

-- Average marks per city (sorted by average marks ascending)
SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY AVG(marks) ASC;

-- Average marks per city (sorted by city name descending)
SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY city DESC;

-- Average marks per city (sorted by average marks descending)
SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY AVG(marks) DESC;

--------------------------------------------------
-- PRACTICE QUERY
--------------------------------------------------
/*
Total number of students in each grade.
*/
SELECT grade, COUNT(rollno)
FROM student
GROUP BY grade
ORDER BY grade ASC;