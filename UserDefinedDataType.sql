-- user defined datatype
-- we can create own domain and datatype

create table student (
id serial primary key,
First_name varchar NOT NULL,
Last_name varchar NOT NULL,
City varchar NOT NULL
CHECK(
First_name!~ '\s' AND Last_name!~ '\s'
))

select * from student
drop table student
insert into student (first_name,last_name,city) values
('venky', 'alane', 'nanded')

--create own domain
create domain name_field_check as varchar NOT NULL CHECK( value!~ '\s')

create table student1 (
ID serial primary key,
First_name name_field_check,
Last_name name_field_check,
City name_field_check)

select * from student1
insert into student1 (First_name,Last_name,City) values
('venkys', 'alane', 'nanded')

--create type
create type college_details as (
ID int,
COLLEGE_NAME varchar,
EST_YEAR varchar)

create function college_details_summary(CID int)
returns college_details as
$$
select id,college_name,est_year from college where id = cid;
$$
language sql;

create table college(id int,college_name varchar,est_year varchar)
insert into college values (2, 'MIT', '1953'),(3, 'NIT', '1975'),(4, 'IIT', '1999'),(5, 'YCM', '1968')

select * from college_details_summary(2)
