CREATE DATABASE IF NOT EXISTS sql_foreign_db;
USE sql_foreign_db;

--------------------------------------------------
-- PARENT TABLE
--------------------------------------------------
/*
Table: dept
Role:
Parent table that stores department data.
Its primary key will be referenced by child tables.
*/
CREATE TABLE dept (
    id   INT PRIMARY KEY,     -- Unique department identifier
    name VARCHAR(50)          -- Department name
);

--------------------------------------------------
-- CHILD TABLE WITH FOREIGN KEY
--------------------------------------------------
/*
Table: teacher
Role:
Child table that depends on dept.
Each teacher is associated with a department.
*/
CREATE TABLE teacher (
    id      INT PRIMARY KEY,  -- Unique teacher identifier
    name    VARCHAR(50),      -- Teacher name
    dept_id INT,              -- References dept(id)
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    -- dept is the parent table
    -- teacher is the child table due to foreign key dependency
);

--------------------------------------------------
-- VISUALIZING RELATIONSHIPS
--------------------------------------------------
/*
Table relationships can be visualized using
Reverse Engineer / ER Diagram tools in database GUIs.
*/

--------------------------------------------------
-- INSERT SAMPLE DATA
--------------------------------------------------
INSERT INTO dept VALUES
(101, "English"),
(102, "IT");

SELECT * FROM dept;

INSERT INTO teacher VALUES
(101, "Adam", 101),
(102, "Eve", 102);

SELECT * FROM teacher;

--------------------------------------------------
-- REFERENTIAL INTEGRITY RULE
--------------------------------------------------
/*
A parent row cannot be deleted or updated
if it is referenced by a child table.

Reason:
Doing so would break referential integrity.

Allowed:
- Deleting child rows first
- Then deleting or updating parent rows
*/

--------------------------------------------------
-- CASCADING ACTIONS (UPDATE / DELETE)
--------------------------------------------------
/*
Cascading rules automate parent-child synchronization.

ON DELETE CASCADE:
- Deletes child rows when the parent row is deleted

ON UPDATE CASCADE:
- Updates child foreign key values when the parent key changes
*/

--------------------------------------------------
-- RECREATING CHILD TABLE WITH CASCADE RULES
--------------------------------------------------

-- Drop old child table (no cascade rules)
DROP TABLE teacher;

-- Recreate child table with cascading behavior
CREATE TABLE teacher (
    id      INT PRIMARY KEY,
    name    VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

--------------------------------------------------
-- INSERT DATA AGAIN
--------------------------------------------------
INSERT INTO teacher VALUES
(101, "Adam", 101),
(102, "Eve", 102);

SELECT * FROM teacher;

--------------------------------------------------
-- CASCADE IN ACTION (UPDATE)
--------------------------------------------------

-- Updating parent table primary key
UPDATE dept SET id = 103 WHERE id = 102;

SELECT * FROM dept;
SELECT * FROM teacher;
-- Child table updated automatically due to ON UPDATE CASCADE

UPDATE dept SET id = 111 WHERE id = 101;

SELECT * FROM dept;
SELECT * FROM teacher;
-- Child table updated again automatically

--------------------------------------------------
-- DATABASE STATE
--------------------------------------------------
SHOW TABLES;