--firstly crate extension
CREATE EXTENSION hstore;

--create table with attribute1 column with hstore datatype
create table books (
id serial primary key,
title varchar(50),
attribute1 hstore );

--insert record (syntax: '"key" => "value", "key" => "value"')
INSERT INTO books (title, attribute1)
VALUES
	(
	   'PostgreSQL book',
	   '"pages" => "243",
	    "publisher" => "postgresqltutorial.com",
	    "language"  => "English",
	    "ISBN-13"   => "978-1449370000",
		"weight"    => "1.2KG"'
	);
INSERT INTO books (title, attribute1)
VALUES
	(
		'PostgreSQL Sheet',
		'"pages" => "5",
         "publisher" => "postgresqltutorial.com",
         "language"  => "English",
         "ISBN-13"   => "978-1449370001",
         "weight"    => "1 KG"'
	);
insert into books (title, attribute1) values
(
	'postgreSQL tutorial',
    '"pages" => "45",
     "weight" => "500 gm",
     "ISBN-13" => "978-4561265982",
     "language" => "English",
     "publisher" => "venkyalane.com"'
);
insert into books (title, attribute1) values
(
	'database tutorial',
    '"pages" => "100",
     "weight" => "1.5 kg",
     "ISBN-13" => "978-1245784526",
     "language" => "English",
     "publisher" => "greek.com"'
);
insert into books (title, attribute1) values
(
	'python tutorial',
    '"pages" => "500",
     "weight" => "2.5 kg",
     "ISBN-13" => "978-45612578",
     "language" => "English",
     "publisher" => "dknanded.com"'
);
insert into books (title, attribute1) values
(
	'test engineer',
    '"pages" => "100",
     "weight" => "2.3kg",
     "ISBN-13" => "978-45781245",
     "language" => "English",
     "publisher" => "dineshkamjalge.com"'
);
insert into books (title, attribute1) values
(
	'automation tutorial',
    '"pages" => "90",
     "weight" => "500 gm",
     "ISBN-13" => "978-4512784",
     "language" => "English",
     "publisher" => "venkyalane.com"'
);
select * from books;

--fetch record (syntax: col_name->'key' as new_col_name)
select title, attribute1 ->'publisher' as publisher from books

--split hstore data into normal table
select id,
title,
attribute1 ->'pages' as Pages,
attribute1 ->'weight' as Weight,
attribute1 ->'ISBN-13' as ISBN_13,
attribute1 ->'language' as Lang,
attribute1 ->'publisher' as Publisher from books;

--fetch record using where clause, condition is pages is 5
select * from books
where attribute1 -> 'publisher' = 'postgresqltutorial.com'
and
attribute1 -> 'pages' = '5'

--find the title name who have isbn-13 number is "978-1449370001"
select title from books
where attribute1 ->'ISBN-13' = '978-1449370001'

--find the books names who have publisher name is venkyalane.com.
select id,
title,
attribute1 ->'publisher' as publisher_name from books
where
attribute1 ->'publisher' = 'venkyalane.com'

--find the book name of dineshkamjlage.com publisher.
select id, title, attribute1 ->'publisher' as publisher_name from books
where
attribute1 ->'publisher' = 'dineshkamjalge.com'

select count(*) from books