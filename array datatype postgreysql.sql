create table sample (S_id int, Name varchar(20), City varchar(20))

select * from sample

insert into sample values (1, 'Venky', 'Nanded'),
(2, 'Mohan', 'Nagar'),
(3, 'Priya', 'Pune'),
(4, 'Komal', 'Nanded'),
(5, 'Anil', 'Mumbai')

'''add column phones array datatype'''
alter table sample add Phones text [ ]

create table contact (
id serial primary key,
Name varchar(20),
Phones text[])

select * from contact

insert into contact (Name, Phones) values ('Venky', array['+91-8408833293', '+91-9765473291'])
INSERT INTO contact (name, phones)
VALUES('John Doe',ARRAY [ '(91)-589-5846','(91)-589-5555' ]);

INSERT INTO contact (name, phones) VALUES('Simion Kate', Array[ '(91)-589-5847','(91)-589-5567' ]);
INSERT INTO contact (name, phones)VALUES('Lily Bush','{"(91)-589-5841"}'),
      ('William Gate','{"(91)-589-5842","(91)-589-58423"}');

INSERT INTO contact (name, phones)VALUES('Shuan Mike','{"(91)-589-6789"}')

select *, Phones[2] as personal_phones from contact
select * from contact where phones[2]='(91)-589-5567'
select id, name, phones[2] from contact where phones[2]='(91)-589-5567'

update contact set phones[3]='(91)-4512454' where id = 3
update contact set phones = '{"(91)-7548125"}' where id = 6

select * from contact order by id

select ID, Name, unnest(phones) as Cell_numbers from contact