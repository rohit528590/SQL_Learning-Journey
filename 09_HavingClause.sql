CREATE DATABASE IF NOT EXISTS sql_having_clause_db;
USE sql_having_clause_db;

--------------------------------------------------
-- TABLE SETUP
--------------------------------------------------
/*
Table: student
Purpose:
Practice filtering, grouping, and post-aggregation conditions.
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
-- HAVING CLAUSE
--------------------------------------------------
/*
HAVING is used to filter GROUPED results.
Key difference:
- WHERE filters individual rows (before grouping)
- HAVING filters groups (after aggregation)
*/

--------------------------------------------------
-- CITY-WISE STUDENT COUNTS WITH CONDITIONS
--------------------------------------------------

/*
Counts students per city where individual students scored > 90.
This filters rows first, then groups.
*/
SELECT city, COUNT(rollno) AS total
FROM student
WHERE marks > 90
GROUP BY city;

/*
Counts cities where at least ONE student scored > 90.
Explanation:
- (marks > 90) becomes TRUE/FALSE
- MAX(TRUE/FALSE) checks if any row satisfies condition
*/
SELECT city, COUNT(rollno) AS total
FROM student
GROUP BY city
HAVING MAX(marks > 90);

--------------------------------------------------
-- BASIC GROUPING
--------------------------------------------------

-- Unique list of cities (grouping without aggregation)
SELECT city FROM student GROUP BY city;

-- Count students per city
SELECT city, COUNT(rollno) AS Number_Of_Student
FROM student
GROUP BY city;

-- Count students only in cities where max marks exceed 90
SELECT city, COUNT(rollno) AS Number_Of_Student
FROM student
GROUP BY city
HAVING MAX(marks) > 90;

--------------------------------------------------
-- GROUPING BY GRADE
--------------------------------------------------

-- Total students per grade
SELECT grade, COUNT(rollno) AS Number_Of_Student
FROM student
GROUP BY grade
ORDER BY grade;

-- Grades where highest scorer has at least 80 marks
SELECT grade, COUNT(name) AS Number_Of_Student
FROM student
GROUP BY grade
HAVING MAX(marks) >= 80;

-- Same as above, but sorted by grade
SELECT grade, COUNT(name) AS Number_Of_Student
FROM student
GROUP BY grade
HAVING MAX(marks) >= 75
ORDER BY grade;

--------------------------------------------------
-- EXECUTION ORDER (CRITICAL TO REMEMBER)
--------------------------------------------------
/*
SQL logical execution order:
1. FROM
2. WHERE        → filters rows
3. GROUP BY     → forms groups
4. HAVING       → filters groups
5. SELECT
6. ORDER BY
*/

--------------------------------------------------
-- WHERE vs GROUP BY (IMPORTANT DISTINCTION)
--------------------------------------------------

-- Lists cities of ALL students with grade A (duplicates possible)
SELECT city
FROM student
WHERE grade = "A";

-- Lists UNIQUE cities that have at least one grade A student
SELECT city
FROM student
WHERE grade = "A"
GROUP BY city;

--------------------------------------------------
-- HAVING WITH CONDITIONAL AGGREGATION
--------------------------------------------------

/*
Cities having grade A students AND
at least one such student scored above 93.
*/
SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks > 93);

-- Cities with grade A students having marks >= 90
SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks >= 90)
ORDER BY city;

-- Same result, but ranked by highest marks
SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks >= 90)
ORDER BY MAX(marks) DESC;

--------------------------------------------------
-- GROUPING VS FILTERING GRADES
--------------------------------------------------

-- Repeated grades (row-level filtering)
SELECT grade
FROM student
WHERE marks >= 75
ORDER BY grade;

-- Unique grades only (group-level view)
SELECT grade
FROM student
WHERE marks >= 75
GROUP BY grade
ORDER BY grade;

-- Grades having at least one student with marks >= 80
SELECT grade
FROM student
WHERE marks >= 75
GROUP BY grade
HAVING MAX(marks >= 80)
ORDER BY grade;

-- Same, ranked by highest marks
SELECT grade
FROM student
WHERE marks >= 75
GROUP BY grade
HAVING MAX(marks >= 80)
ORDER BY MAX(marks) DESC;

-- Only grades where someone scored >= 90
SELECT grade
FROM student
WHERE marks >= 75
GROUP BY grade
HAVING MAX(marks >= 90)
ORDER BY MAX(marks) DESC;