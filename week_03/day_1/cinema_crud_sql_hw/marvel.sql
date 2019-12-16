DROP TABLE movies;
DROP TABLE people;

CREATE TABLE movies
(
	id SERIAL8 PRIMARY KEY,
	title VARCHAR(255),
	year INT2,
	show_time VARCHAR(255)
);

CREATE TABLE people
(
	id SERIAL8 PRIMARY KEY,
	name VARCHAR(255)
);

INSERT INTO people (name) VALUES ('George Gordon');
INSERT INTO people (name) VALUES ('Stephen Gossip');
INSERT INTO people (name) VALUES ('Simon Hall');
INSERT INTO people (name) VALUES ('Katherine Kerr');
INSERT INTO people (name) VALUES ('John McNeill');
INSERT INTO people (name) VALUES ('Shae Nicholsun');
INSERT INTO people (name) VALUES ('Rory O''Shea');
INSERT INTO people (name) VALUES ('Jamie Paterson');
INSERT INTO people (name) VALUES ('Harrison Booth');
INSERT INTO people (name) VALUES ('Stephanie Scullion');
INSERT INTO people (name) VALUES ('Patryk Smacki');
INSERT INTO people (name) VALUES ('Robert Tam');
INSERT INTO people (name) VALUES ('Michal Tyranski');
INSERT INTO people (name) VALUES ('Michael Urquhart');
INSERT INTO people (name) VALUES ('Kyle Walker');
INSERT INTO people (name) VALUES ('Jeremy Wood');

INSERT INTO movies (title, year, show_time) VALUES ('Iron Man', 2008, '15:10');
INSERT INTO movies (title, year, show_time) VALUES ('The Incredible Hulk', 2008, '20:45');
INSERT INTO movies (title, year, show_time) VALUES ('Iron Man 2', 2010, '13:15');
INSERT INTO movies (title, year, show_time) VALUES ('Thor', 2011, '18:55');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: The First Avenger', 2011, '22:50');
INSERT INTO movies (title, year, show_time) VALUES ('Avengers Assemble', 2012, '12:35');
INSERT INTO movies (title, year, show_time) VALUES ('Iron Man 3', 2013, '15:35');
INSERT INTO movies (title, year, show_time) VALUES ('Thor: The Dark World', 2013, '15:55');
INSERT INTO movies (title, year, show_time) VALUES ('Batman Begins', 2005, '15:40');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: The Winter Soldier', 2014, '21:00');
INSERT INTO movies (title, year, show_time) VALUES ('Guardians of the Galaxy', 2014, '23:40');
INSERT INTO movies (title, year, show_time) VALUES ('Avengers: Age of Ultron', 2015, '21:25');
INSERT INTO movies (title, year, show_time) VALUES ('Ant-Man', 2015, '23:40');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: Civil War', 2016, '15:15');
INSERT INTO movies (title, year, show_time) VALUES ('Doctor Strange', 2016, '22:35');
INSERT INTO movies (title, year, show_time) VALUES ('Guardians of the Galaxy 2', 2017, '15:55');
INSERT INTO movies (title, year, show_time) VALUES ('Spider-Man: Homecoming', 2017, '17:40');
INSERT INTO movies (title, year, show_time) VALUES ('Thor: Ragnarok', 2017, '15:55');
INSERT INTO movies (title, year, show_time) VALUES ('Black Panther', 2018, '17:45');
INSERT INTO movies (title, year, show_time) VALUES ('Avengers: Infinity War', 2018, '14:50');
