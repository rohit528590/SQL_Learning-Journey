-- Create database only if it does not already exist
CREATE DATABASE IF NOT EXISTS sql_practice02_db;

-- Set ApnaCollege as the active database
USE sql_practice02_db;

--------------------------------------------------
-- TABLE SETUP
--------------------------------------------------
/*
Table: student
Purpose:
Store student performance data for aggregation practice.
*/
CREATE TABLE IF NOT EXISTS student (
    rollno INT PRIMARY KEY,     -- Unique student identifier
    name   VARCHAR(50),         -- Student name
    marks  INT NOT NULL,        -- Marks must always be present
    grade  VARCHAR(1),          -- Grade (A–F)
    city   VARCHAR(20)          -- Student city
);

--------------------------------------------------
-- DATA INSERTION
--------------------------------------------------
/*
Insert sample data for GROUP BY and ORDER BY queries.
*/
INSERT INTO student (rollno, name, marks, grade, city) VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhrub", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

--------------------------------------------------
-- AVERAGE MARKS PER CITY (ASCENDING)
--------------------------------------------------
/*
GROUP BY city:
- Combines all students from the same city.
AVG(marks):
- Calculates average marks per city.
ORDER BY city ASC:
- Sorts results alphabetically by city name.
*/
SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY city ASC;

/*
ORDER BY AVG(marks) ASC:
- Sorts cities based on their average marks (lowest to highest).
- Useful for ranking city-wise performance.
*/
SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY AVG(marks) ASC;

--------------------------------------------------
-- AVERAGE MARKS PER CITY (DESCENDING)
--------------------------------------------------
/*
ORDER BY city DESC:
- Same averages, but cities sorted in reverse alphabetical order.
*/
SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY city DESC;

/*
ORDER BY AVG(marks) DESC:
- Sorts cities from highest average marks to lowest.
- Typical “top-performing city” analysis.
*/
SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY AVG(marks) DESC;