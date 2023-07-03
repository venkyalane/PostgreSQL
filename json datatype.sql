--create table with information column json datatype
create table orders (
ID serial NOT NULL primary key,
Information json)

--insert data (syntax: ('{"key":"value", "key": {"key":"value", "key":"value"}}'))
INSERT INTO orders (information)
VALUES ('{ "customer": "John Doe", "items": {"product": "Beer","qty": 6}}'),
       ('{ "customer": "Lily Bush", "items": {"product": "Diaper","qty": 24}}'),
       ('{ "customer": "Josh William", "items": {"product": "Toy Car","qty": 1}}'),
       ('{ "customer": "Mary Clark", "items": {"product": "Toy Train","qty": 2}}'),
       ('{"customer":"venky alane", "items":{"product":"pen", "qty":10}}')
	   
insert into orders (information) values
('{"customer":"dinesh k", "items":{"product":"books"}}')
select * from orders

-> :it return only json value
->> :it return only text value

select information ->'customer' as Customer from orders
select information ->>'customer' as Customer from orders

--show all customer information as table format from json format
select ID, information ->>'customer' as Customer_Name,
information ->'items' ->>'product' as Product_Name,
information ->'items' ->>'qty' as QTY from orders

--show customer name who has perches diaper
select ID,information ->'customer' as customer_name from orders
where information ->'items' ->>'product' = 'Diaper'

--show all information about that customer who has purches diaper
select * from orders
where information ->'items' ->>'product' = 'Diaper'

select information ->'items' ->>'product' as Product from orders
where cast(information ->'items' ->>'qty' as integer) = 2

select ID, information ->>'customer' as Customer_Name,
information ->'items' ->>'product' as Product_Name,
information ->'items' ->>'qty' as QTY from orders
where cast(information ->'items' ->>'qty' as integer) =10

select * from orders
where cast(information ->'items' ->>'qty' as integer) =10

select min(information ->'items' ->>'qty') from orders

--functions
--returns key and value in tupple format
select json_each(information) from orders where id = 1
--returns key in text format with value in tupple format
select json_each_text(information) from orders where id =1
--it retuns how many keys presence in that column
select json_object_keys(information) from orders where id =1
select json_object_keys(information ->'items') from orders where id = 1
--it return datatype of object value
select json_typeof(information->'customer') from orders
SELECT json_typeof(information->'items'->'qty') FROM orders where id =5;