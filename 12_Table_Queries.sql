CREATE DATABASE IF NOT EXISTS sql_table_quries_db;
USE sql_table_quries_db;

--------------------------------------------------
-- TABLE DEFINITION
--------------------------------------------------
/*
Table: student
Purpose:
Practice ALTER, TRUNCATE, and DROP operations.
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
-- ALTER TABLE (SCHEMA CHANGES)
--------------------------------------------------
/*
ALTER TABLE modifies table structure (schema),
not the stored data logic.
*/

--------------------------------------------------
-- ADD COLUMN
--------------------------------------------------
/*
Adds a new column to the table.
Existing rows receive NULL unless a DEFAULT is provided.
*/
ALTER TABLE student ADD COLUMN age INT;

SELECT * FROM student;

--------------------------------------------------
-- DROP COLUMN
--------------------------------------------------
/*
Removes a column permanently.
Column data is lost and cannot be recovered.
*/
ALTER TABLE student DROP COLUMN age;

SELECT * FROM student;

--------------------------------------------------
-- ADD COLUMN WITH CONSTRAINT
--------------------------------------------------
/*
Adds column with NOT NULL constraint.
DEFAULT is required to populate existing rows.
*/
ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;

SELECT * FROM student;

--------------------------------------------------
-- MODIFY COLUMN
--------------------------------------------------
/*
Changes datatype or constraints of an existing column.
Column name remains the same.
*/
ALTER TABLE student
MODIFY COLUMN age VARCHAR(2);

--------------------------------------------------
-- CHANGE COLUMN (RENAME + TYPE)
--------------------------------------------------
/*
Renames a column and optionally changes its datatype.
*/
ALTER TABLE student
CHANGE COLUMN age stu_age INT;

--------------------------------------------------
-- INSERT WITH UPDATED SCHEMA
--------------------------------------------------
/*
Column order matters when column list is omitted.
Always safer to specify column names explicitly.
*/
INSERT INTO student (rollno, name, marks, grade, stu_age, city)
VALUES (107, "Abhishek", 93, "A", 16, "Imamganj");

INSERT INTO student
VALUES (108, "Saniya", 92, "A", "Patna", 14);

SELECT * FROM student;

--------------------------------------------------
-- DROP COLUMN AGAIN
--------------------------------------------------
/*
Remove stu_age column from the table.
*/
ALTER TABLE student DROP COLUMN stu_age;

SELECT * FROM student;

--------------------------------------------------
-- RENAME TABLE
--------------------------------------------------
/*
Renames the table without affecting data.
*/
ALTER TABLE student RENAME TO stu;

SELECT * FROM stu;

-- Rename back to original name
ALTER TABLE stu RENAME TO student;

SELECT * FROM student;

--------------------------------------------------
-- TRUNCATE TABLE
--------------------------------------------------
/*
TRUNCATE:
- Deletes ALL rows
- Resets auto-increment counters
- Cannot be rolled back
- Table structure remains intact
*/
TRUNCATE TABLE student;

SELECT * FROM student;

--------------------------------------------------
-- DROP TABLE
--------------------------------------------------
/*
DROP TABLE:
- Deletes table structure and all data
- Table no longer exists
*/
DROP TABLE student;