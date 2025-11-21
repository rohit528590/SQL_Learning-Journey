/* Practice Problems Set 1
   Step1: Create a database for your company named XYZ.
   Step2: Add following information in the DB :
			1, 'Adam', 25000
			2, 'Bob', 30000
			3, 'Casey', 40000
	Step3: Select & view all your table data.
    Notes:
    - Names and salaries use consistent formatting.
    - Queries are structured for clarity and long-term reference.
*/

/* Create the database */
CREATE DATABASE XYZ;
USE XYZ;

/* Create employee_info table */
CREATE TABLE employee_info (
    name VARCHAR(50) NOT NULL,
    salary INT NOT NULL
);

/* Insert sample employee records */
INSERT INTO employee_info VALUES
('Adam', 25000),
('Bob', 30000),
('Casey', 40000);

/* View all employee records */
SELECT * FROM employee_info;
