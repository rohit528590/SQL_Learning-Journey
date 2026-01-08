CREATE DATABASE sql_practice04_db;
USE sql_practice04_db;

--------------------------------------------------
-- TABLE DEFINITION
--------------------------------------------------
/*
Table: student
Purpose:
Practice ALTER and DELETE operations on existing data.
*/
CREATE TABLE IF NOT EXISTS student (
    rollno INT PRIMARY KEY,     -- Unique identifier for each student
    name   VARCHAR(50),         -- Student name
    marks  INT NOT NULL,        -- Marks must always exist
    grade  VARCHAR(1),          -- Grade (A–F)
    city   VARCHAR(20)          -- Student city
);

--------------------------------------------------
-- SAMPLE DATA
--------------------------------------------------
INSERT INTO student (rollno, name, marks, grade, city) VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhrub", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

-- Verify initial data
SELECT * FROM student;

--------------------------------------------------
-- PRACTICE QUESTIONS
--------------------------------------------------
/*
Tasks:
a) Rename column `name` to `full_name`
b) Delete students with marks below 80
c) Remove the `grade` column from the table
*/

--------------------------------------------------
-- (a) RENAME COLUMN
--------------------------------------------------
/*
CHANGE COLUMN renames a column and can also modify its datatype.
*/
ALTER TABLE student
CHANGE COLUMN name full_name VARCHAR(100);

SELECT * FROM student;

--------------------------------------------------
-- (b) DELETE ROWS BASED ON CONDITION
--------------------------------------------------
/*
Deletes only rows where marks are less than 80.
Data removal is permanent unless using transactions.
*/
SET sql_safe_updates = 0;

DELETE FROM student
WHERE marks < 80;

SELECT * FROM student;

--------------------------------------------------
-- (c) DROP COLUMN
--------------------------------------------------
/*
Removes the grade column entirely.
Column structure and data are permanently lost.
*/
ALTER TABLE student
DROP COLUMN grade;

SELECT * FROM student;