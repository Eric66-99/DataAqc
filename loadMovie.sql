-- LOAD films.sql

DROP TABLE IF EXISTS filmRating;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS raters;


CREATE TABLE filmRating (
  nid char(2),
  id varchar(2),
  rating integer
  );
  
LOAD  DATA INFILE  'C:/Mdata/films/filmRating.csv' 
INTO TABLE filmRating 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE films (
  id char(2),
  name varchar(100)
  );
  
LOAD  DATA INFILE  'C:/Mdata/films/films.csv' 
INTO TABLE films 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


CREATE TABLE raters (
  nid char(2),
  name varchar(100)
  );
  
LOAD  DATA INFILE  'C:/Mdata/films/raters.csv' 
INTO TABLE raters 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




SELECT a.name, f.name, r.rating from filmRating r, films f, raters a
where r.id=f.id and r.nid=a.nid order by a.name
