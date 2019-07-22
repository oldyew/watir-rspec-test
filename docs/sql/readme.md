
# DATABASE

CREATE DATABASE <database name>;
USE <database name>; - select db for use
DESCRIBE <database name>; - get all info about db structure
drop database sample;

## TABLES

### CREATE TABLE

CREATE TABLE table_name (
    column_1 data_type,
    column_2 data_type,
    column_3 data_type
  );
CREATE TABLE celebs (id INTEGER, name TEXT, age INTEGER);
create table Employeeinfo(name varchar(20),id int,location varchar(20),age int);
CREATE TABLE awards (
  id INTEGER PRIMARY KEY,
  recipient TEXT NOT NULL,
  award_name TEXT DEFAULT "Grammy");
CREATE TABLE celebs (
    id INTEGER PRIMARY KEY,
    name TEXT UNIQUE,
    date_of_birth TEXT NOT NULL,
    date_of_death TEXT DEFAULT 'Not Applicable',
);

### INSERT INTO - adds a new row to a table

INSERT INTO celebs (id, name, age) VALUES (1, 'Justin Bieber', 21);

### SELECT - queries data from a table

SELECT * FROM <name>;
SELECT name FROM celebs;
SELECT name, imdb_rating FROM movies;

### DISTINCT - Unique values

SELECT DISTINCT genre FROM movies;

### UPDATE - edits a row in a table

UPDATE celebs SET age = 22 WHERE id = 1;

### ALTER TABLE - changes an existing table

ALTER TABLE celebs ADD COLUMN twitter_handle TEXT;
alter table Employeeinfo drop gender;
alter table Employeeinfo add gender varchar(10);

### DELETE FROM - deletes rows from a table

DELETE FROM celebs WHERE twitter_handle IS NULL;

### WHERE - a popular command that lets you filter the results of the query based on conditions that you specify

SELECT * FROM movies WHERE imdb_rating > 8;

### LIKE, BETWEEN, IN - special operators that can be used in a WHERE clause

SELECT * FROM movies WHERE name LIKE 'Se_en';
select countrycode from city where countrycode like '_A%';
SELECT * FROM movies WHERE name LIKE 'a%';
SELECT * FROM movies WHERE name LIKE '%man%';
select name from employeeinfo where age IN(23,24,25);
SELECT * FROM movies WHERE name BETWEEN 'A' AND 'J';

### AND and OR - special operators that you can use with WHERE to filter the query on two or more conditions

SELECT * FROM movies WHERE year BETWEEN 1990 AND 2000 AND genre = 'comedy';
SELECT * FROM movies  WHERE genre = 'comedy' OR year < 1980;

### ORDER BY - lets you sort the results of the query in either ascending or descending order

SELECT * FROM movies ORDER BY imdb_rating DESC;

### LIMIT lets you specify the maximum number of rows that the query will return

SELECT * FROM movies ORDER BY imdb_rating ASC LIMIT 3;

## Aggregate functions combine multiple rows together to form a single value of more meaningful information

### COUNT - takes the name of a column(s) as an argument and counts the number of rows where the value(s) is not NULL

SELECT COUNT(*) FROM fake_apps;
SELECT COUNT(*) FROM fake_apps WHERE price = 0;
SELECT COUNT(*), Month FROM Transactions GROUP BY Month HAVING COUNT( *)<2;

### GROUP BY - a clause used with aggregate functions to combine data from one or more columns

SELECT price, COUNT(*) FROM fake_apps GROUP BY price;
SELECT price, COUNT(*) FROM fake_apps WHERE downloads > 20000 GROUP BY price;

### SUM() - takes the column name as an argument and returns the sum of all the values in that column

SELECT SUM(downloads) FROM fake_apps;
SELECT category, SUM(downloads) FROM fake_apps GROUP BY category;
select sum(Amount),Month from Transactions where branch = 'bangalore' or branch ='chicago' group by Month having sum(Amount)>20000;

### MAX() - takes the column name as an argument and returns the largest value in that column

SELECT MAX(downloads) FROM fake_apps;
SELECT name, category, MAX(downloads) FROM fake_apps GROUP BY category;

### MIN() - takes the column name as an argument and returns the smallest value in that column

SELECT MIN(downloads) FROM fake_apps;
SELECT name, category, MIN(downloads) FROM fake_apps GROUP BY category;

### AVG() - takes a column name as an argument and returns the average value for that column

SELECT AVG(downloads) FROM fake_apps;
SELECT price, AVG(downloads) FROM fake_apps GROUP BY price;

### ROUND() - takes two arguments, a column name and the number of decimal places to round the values in that column

SELECT price, ROUND(AVG(downloads), 2) FROM fake_apps GROUP BY price;

### PRIMARY KEY is a column that serves a unique identifier for row in the table. Values in this column must be unique and cannot be NULL

DROP TABLE IF EXISTS albums;
CREATE TABLE IF NOT EXISTS albums(
  id INTEGER PRIMARY KEY,
  name TEXT,
  artist_id INTEGER,
  year INTEGER);

### FOREIGN KEY is a column that contains the primary key to another table in the database. It is used to identify a particular row in the referenced table

DROP TABLE IF EXISTS albums;
CREATE TABLE IF NOT EXISTS albums(
  id INTEGER PRIMARY KEY,
  name TEXT,
  year INTEGER,
  artist_id INTEGER,
  FOREIGN KEY(artist_id) REFERENCES artist(id)
);

## JOINS are used in SQL to combine data from multiple tables

### CROSS JOIN

SELECT albums.name, albums.year, artists.name FROM albums, artists;

### INNER JOIN will combine rows from different tables if the join condition is true

SELECT * FROM albums JOIN artists ON albums.artist_id = artists.id;

### LEFT OUTER JOIN will return every row in the left table, and if the join condition is not met, NULL values are used to fill in the columns from the right table

SELECT * FROM albums LEFT JOIN artists ON albums.artist_id = artists.id;

### AS is a keyword in SQL that allows you to rename a column or table in the result set using an alias

SELECT albums.name AS 'Album', albums.year, artists.name AS 'Artist' FROM albums JOIN artists ON albums.artist_id = artists.id WHERE albums.year > 1980;

## Subqueries

- Subqueries are used to complete an SQL transformation by nesting one query within another query.
- A non-correlated subquery is a subquery that can be run independently of the outer query and can be used to complete a multi-step transformation.
- A correlated subquery is a subquery that cannot be run independently of the outer query. The order of operations in a correlated subquery is as follows:

1. A row is processed in the outer query.
2. Then, for that particular row in the outer query, the subquery is executed.

### UNION

select * from College union (select * from Results);
select * from College union all(select * from Results);
select * from college where id in (select id from Results);

### EXISTS

select * from College where exists ( select * from College where name='Ramfdsfd');

### CASE

select score,
case name
when 'tim' then score*2
when 'sam' then score-25
when 'tina' then score*3
else score
end
'NewScore',name from Marks;
