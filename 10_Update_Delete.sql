CREATE DATABASE IF NOT EXISTS sql_update_delete_db;
USE sql_update_delete_db;

--------------------------------------------------
-- TABLE DEFINITION
--------------------------------------------------
/*
Table: student
Purpose:
Practice UPDATE and DELETE operations safely and intentionally.
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

--------------------------------------------------
-- UPDATE STATEMENTS
--------------------------------------------------
/*
UPDATE modifies existing rows.
Always verify affected rows using SELECT before and after.
*/

-- Enable safe update mode (prevents updates without key-based WHERE)
SET sql_safe_updates = 1;

-- Disable safe update mode (use with caution)
SET sql_safe_updates = 0;

--------------------------------------------------
-- SIMPLE CONDITIONAL UPDATE
--------------------------------------------------
/*
Update grade for all students currently graded 'A'.
*/
UPDATE student
SET grade = "O"
WHERE grade = "A";

SELECT name, marks, grade FROM student;

--------------------------------------------------
-- UPDATING A SINGLE ROW USING PRIMARY KEY
--------------------------------------------------
/*
Always prefer PRIMARY KEY in WHERE clause for precision.
*/
SELECT name, marks FROM student WHERE rollno = 105;

UPDATE student
SET marks = 82
WHERE rollno = 105;

SELECT name, marks, grade FROM student WHERE rollno = 105;

--------------------------------------------------
-- EXAMPLE OF A LOGICALLY RISKY UPDATE
--------------------------------------------------
/*
This update overwrites grades for ALL students scoring above 80.
Technically valid, logically dangerous if grading rules differ.
*/
UPDATE student
SET grade = "B"
WHERE marks > 80;

--------------------------------------------------
-- BETTER, RULE-BASED UPDATES
--------------------------------------------------
/*
Apply grading rules using proper mark ranges.
This preserves logical consistency.
*/
UPDATE student
SET grade = "O"
WHERE marks > 90;

UPDATE student
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;

--------------------------------------------------
-- MASS UPDATE USING EXISTING VALUES
--------------------------------------------------
/*
Increase marks for all students by 1.
Use carefully; affects every row.
*/
UPDATE student
SET marks = marks + 1;

SELECT name, marks, grade FROM student;

--------------------------------------------------
-- CORRECTING DATA BEFORE REAPPLYING RULES
--------------------------------------------------
/*
Reset marks for a specific student, then re-evaluate grade.
*/
UPDATE student
SET marks = 12
WHERE rollno = 105;

UPDATE student
SET grade = "F"
WHERE marks BETWEEN 0 AND 35;

SELECT rollno, name, marks, grade FROM student;

--------------------------------------------------
-- DELETE STATEMENTS
--------------------------------------------------
/*
DELETE permanently removes rows.
There is NO undo unless you are inside a transaction.
*/

-- Delete students who failed
DELETE FROM student
WHERE marks < 33;

SELECT rollno, name, marks, grade FROM student;

--------------------------------------------------
-- DANGEROUS OPERATION
--------------------------------------------------
/*
Deletes ALL rows from the table.
Structure remains, data is gone.
*/
DELETE FROM student;