--UUID (universal unique identifier)
--uuid value is 128-bit
--it is always unique

--firstly create extension
create extension "uuid-ossp";

--every time generate a unique value
select uuid_generate_v4();
--"a76c50d1-fae8-4ad6-bf8a-93538dfa0073"
--"947ac466-25f5-49eb-ac1b-9921b27995a4"
--"c8903736-9975-4526-9cf7-891121a207e1"

--it is sequence of 32 digit of hexadecimal

--create table
create table payment_domain(
payment_id uuid default uuid_generate_v4() PRIMARY KEY,
Name varchar(20) NOT NULL,
City varchar(20) NOT NULL,
Phone varchar []);

select * from payment_domain

insert into payment_domain (name,city,phone) values
('venky alane', 'nanded', array['+91-8408833293','+91-1234567891']),
('mohan gaiwal', 'nagar', array['+91-8408833294']),
('prasad gomade', 'pune', array['+91-8408833295'])

select payment_id, name, city, phone[2] from payment_domain where name = 'venky alane'
update payment_domain set phone[2] = '+91-4578124568' where payment_id = '4a3c9025-79c0-4d7a-a4c3-be6bd6e01188'

