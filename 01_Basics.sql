Drop database Rohit;
create database	ApnaCollege;
create database CodeWithHarry;
use ApnaCollege;
create database temp1;
drop database temp1;
create table Student(
Id int primary key,
Nmae varchar(50),
Age int not null
);
select * from Student;
select	Id from Student;
drop table Student;
create table student(
id int primary key,
name varchar(50),
age int not null
);
select	* from student;
select id from student;
select id, name from student;
insert into student values (1, "Rohit", 17);
insert into student value (2, "Ravi", 20);
select * from student;
select id, name from student;
select	id Rohit from student;
create database	ApnaCollege;
create database	if not exists ApnaCollege;
drop database if exists Rohit;
show databases;
show tables;
use ApnaCollege;
show tables;
create table if not exists students(
rollno int primary key,
name varchar(50),
class int
);
select * from student;
select * from students;
insert into students values (1, "Rohit", 8);
insert into students values (2, "Ravi", 12); 
select * from students;
insert into students
(class, rollno, name)
values
(9, 3, "Shubham"),
(12, 4, "Khusboo");
insert into students (name, class, rollno) values ("Khusboo", 12, 4);
select * from students;