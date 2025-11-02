-- Basic database creation
CREATE DATABASE Saniya;
CREATE DATABASE Rohit;
CREATE DATABASE temp;

-- Removing a database
DROP DATABASE temp;
DROP DATABASE Saniya;

-- Setting the active database schema
USE Rohit;

-- Creating a table with defined structure
CREATE TABLE Student(
    Id INT PRIMARY KEY,           -- Unique identifier for each student
    Name VARCHAR(50),              -- Student name, up to 50 characters
    Age INT NOT NULL               -- Age must be provided (cannot be empty)
);

-- Safe database creation (no error if already exists)
CREATE DATABASE IF NOT EXISTS Rohit;

-- Safe database deletion (no error if doesn't exist)
DROP DATABASE IF EXISTS Saniya;

-- View all databases in the system
SHOW DATABASES;

-- View all tables in the current database
SHOW TABLES;