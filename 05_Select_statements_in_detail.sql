-- Create database only if it does not already exist
CREATE DATABASE IF NOT EXISTS sql_select_db;
-- Set ApnaCollege as the active database
USE sql_select_db;

--------------------------------------------------
-- TABLE CREATION
--------------------------------------------------
/*
Table: student
Stores basic academic and location data for students.
- rollno uniquely identifies each student
- marks cannot be NULL to avoid incomplete records
*/
CREATE TABLE IF NOT EXISTS student (
    rollno INT PRIMARY KEY,     -- Unique student identifier
    name VARCHAR(50),           -- Student name
    marks INT NOT NULL,         -- Marks must always be provided
    grade VARCHAR(1),           -- Grade represented by a single character
    city VARCHAR(20)            -- City of residence
);

--------------------------------------------------
-- DATA INSERTION
--------------------------------------------------
/*
Insert multiple student records in a single statement.
Efficient and readable for bulk data entry.
*/
INSERT INTO student (rollno, name, marks, grade, city) VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhrub", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

--------------------------------------------------
-- BASIC SELECT STATEMENTS
--------------------------------------------------
/*
Select specific columns instead of all.
Best practice for performance and clarity.
*/
SELECT name, marks FROM student;
SELECT name, city FROM student;

-- Retrieve all columns and rows
SELECT * FROM student;

--------------------------------------------------
-- DISTINCT KEYWORD
--------------------------------------------------
/*
DISTINCT removes duplicate values from the result set.
Used here to list unique cities only.
*/
SELECT DISTINCT city FROM student;

--------------------------------------------------
-- WHERE CLAUSE (FILTERING DATA)
--------------------------------------------------
/*
WHERE filters rows based on conditions.
Only rows satisfying the condition are returned.
*/
SELECT * FROM student WHERE marks > 80;
SELECT name FROM student WHERE marks > 90;
SELECT * FROM student WHERE city = "Mumbai";

-- Combining multiple conditions using AND
SELECT rollno, name, city FROM student
WHERE marks > 85 AND grade < 'C';

SELECT * FROM student
WHERE city = "Mumbai" AND marks > 85;

--------------------------------------------------
-- USING ARITHMETIC OPERATORS IN WHERE
--------------------------------------------------
/*
Arithmetic operations can be applied inside WHERE conditions.
*/
SELECT * FROM student WHERE marks + 10 > 100;
SELECT name, marks, grade FROM student WHERE marks % 4 = 0;

--------------------------------------------------
-- USING COMPARISON OPERATORS IN WHERE
--------------------------------------------------
/*
Comparison operators:
=, !=, >, >=, <, <=
*/
SELECT * FROM student WHERE marks = 93;
SELECT name, city FROM student WHERE marks >= 80;
SELECT name, marks, city FROM student WHERE marks % 2 != 0;

--------------------------------------------------
-- LOGICAL OPERATORS IN WHERE
--------------------------------------------------
/*
Logical operators combine or negate conditions.
Common operators: AND, OR, NOT, IN, BETWEEN, LIKE
*/

-- AND: all conditions must be true
SELECT * FROM student WHERE marks > 90 AND city = "Mumbai";
SELECT name, city FROM student WHERE marks >= 80 AND grade < 'C';

-- OR: at least one condition must be true
SELECT name, rollno FROM student WHERE marks > 90 OR city = "Mumbai";
SELECT name, city, marks FROM student WHERE marks < 80 OR grade >= 'C';

--------------------------------------------------
-- BETWEEN OPERATOR
--------------------------------------------------
/*
BETWEEN selects values within an inclusive range.
*/
SELECT name, rollno, grade FROM student WHERE marks BETWEEN 80 AND 90;
SELECT name, marks FROM student WHERE grade BETWEEN 'A' AND 'C';

--------------------------------------------------
-- IN OPERATOR
--------------------------------------------------
/*
IN matches values from a predefined list.
Cleaner than multiple OR conditions.
*/
SELECT name, rollno, marks FROM student WHERE city IN ("Delhi", "Gurgaon");
SELECT * FROM student WHERE marks IN (92, 93, 96);

--------------------------------------------------
-- NOT OPERATOR
--------------------------------------------------
/*
NOT reverses the condition result.
*/
SELECT name, city, marks FROM student
WHERE city NOT IN ("Delhi", "Mumbai");

SELECT * FROM student
WHERE grade NOT IN ('A', 'B');

--------------------------------------------------
-- LIMIT CLAUSE
--------------------------------------------------
/*
LIMIT restricts the number of rows returned.
Useful for previews and ranking queries.
*/
SELECT * FROM student LIMIT 4;
SELECT * FROM student WHERE marks >= 80 LIMIT 2;

--------------------------------------------------
-- ORDER BY CLAUSE
--------------------------------------------------
/*
ORDER BY sorts the result set.
ASC is default, DESC for reverse order.
*/
SELECT name, marks, city FROM student ORDER BY city ASC;
SELECT * FROM student ORDER BY marks;
SELECT rollno, name, grade FROM student ORDER BY marks DESC;

--------------------------------------------------
-- RANKING QUERIES
--------------------------------------------------
/*
Bottom-performing students (lowest marks first).
*/
SELECT rollno, name, grade
FROM student
ORDER BY marks
LIMIT 3;

/*
Top-performing students (highest marks first).
*/
SELECT *
FROM student
ORDER BY marks DESC
LIMIT 3;