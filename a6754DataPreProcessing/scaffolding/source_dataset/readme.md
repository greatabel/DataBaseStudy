1. touch book.db

2. create tables in db by create_db_schema.sql

3.
.import Book1.csv Book1
或者
sqlite3 book.db -separator ',' '.import Book3.csv Book3'



4. 
Q1:
SELECT ROW_NUMBER() OVER (order by num desc), title, p, pages ,num from 
(
select title, publisher as p , pages,  COUNT(*) as num from Book1 b1 
group by title 

UNION ALL

select book_title as title, publisher_name as p, pages ,COUNT(*) as num from Book2 b2
group by book_title 

UNION ALL

select Title as title, Publisher as p, Pages as pages ,COUNT(*) as num from Book3 b3 
group by Title 

UNION ALL

select Title as title, Publisher as p , Pages as pages, COUNT(*) as num from Book4 b4 
group by Title
)
 limit 100;

