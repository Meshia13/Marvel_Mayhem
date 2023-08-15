# CFG Intro to Data Challenge
# Author: Carmeshia Lazzana
# Date: August 3, 2023
# Title: Marvel Mayhem 

# This project is a demonstration of the skills learned. It utilizes Data Definition Language(DDL) by creating,
# using, dropping and altering databases and tables. It also uses Data Manipulation Language(DML) by selecting and inserting 
# values of the database.

# Droppin database if it exists, creating and using database

DROP DATABASE IF EXISTS Marvel;
CREATE DATABASE Marvel;
USE Marvel;

# Dropping tables if exusts and creating tables for database

DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS disneyplus;
DROP TABLE IF EXISTS hero;
DROP TABLE IF EXISTS disney_hero;
DROP TABLE IF EXISTS movie_hero;

CREATE TABLE movie (
	movie_ID INTEGER AUTO_INCREMENT NOT NULL,
    title VARCHAR(100),
    year_released YEAR,
    phase INTEGER,
    imbd_rating DECIMAL(5,2),
    runtime INTEGER,
    director VARCHAR(100),
    CONSTRAINT movieID_PK PRIMARY KEY (movie_ID)
);

# Inserting values into tables and assigning primary

INSERT INTO movie 
(title, year_released, phase, imbd_rating, runtime, director)
VALUES
('Iron Man', 2008, 1, 7.9, 126, 'Jon Favreau'),
('The Incredible Hulk', 2008, 1, 6.7, 112, 'Louis Leterrier'),
('Iron Man 2', 2010, 1, 7.0, 124, 'Jon Favreau'),
('Thor', 2011, 1, 7.0, 115, 'Kenneth Branagh'),
('Captain America: The First Avenger', 2011, 1, 6.9, 124, 'Joe Johnston'),
('The Avengers', 2012, 1, 8.0, 143, 'Joss Whedon'),
('Iron Man 3', 2013, 2, 7.2, 130, 'Shane Black'),
('Thor: The Dark World', 2013, 2, 6.8, 112, 'Alan Taylor'),
('Captain America: The Winter Soldier', 2014, 2, 7.7, 136, 'Russo Brothers'),
('Guardians of the Galaxy', 2014, 2, 8.0, 122, 'James Gunn'),
('Avengers: Age of Ultron', 2015, 2, 7.3, 141, 'Joss Whedon'),
('Ant-Man', 2015, 2, 7.3, 117, 'Peyton Reed'),
('Captain America: Civil War', 2016, 3, 7.8, 147, 'Russo Brothers'),
('Doctor Strange', 2016, 3, 7.5, 115, 'Scott Derrickson'),
('Guardians of the Galaxy Vol. 2', 2017, 3, 7.6, 137, 'James Gunn'),
('Spider-Man: Homecoming', 2017, 3, 7.4, 133, 'Jon Watts'),
('Thor: Ragnarok', 2017, 3, 7.9, 130, 'Taika Waititi'),
('Black Panther', 2018, 3, 7.3, 134, 'Ryan Coogler'),
('Avengers: Infinity War', 2018, 3, 8.4, 149, 'Russo Brothers'),
('Ant-Man and the Wasp', 2018, 3, 7.1, 118, 'Peyton Reed'),
('Captain Marvel', 2019, 3, 6.9, 124, 'Ryan Fleck'),
('Avengers: Endgame', 2019, 3, 8.4, 181, 'Russo Brothers'),
('Spider-Man: Far From Home', 2019, 3, 7.5, 129, 'Jon Watts'),
('Black Widow', 2021, 4, 6.8, 134, 'Cate Shortland'),
('Shang-Chi and the Legend of the Ten Rings', 2021, 4, 7.4, 132, 'Destin Daniel Cretton'),
('Eternals', 2021, 4, 6.3, 156, 'Chloé Zhao'),
('Spider-Man: No Way Home', 2022, 4, 8.2, 148, 'Jon Watts'),
('Doctor Strange in the Multiverse of Madness', 2022, 4, 6.9, 126, 'Sam Raimi'),
('Thor: Love and Thunder', 2022, 4, 6.3, 119, 'Taika Waititi'),
('Black Panther: Wakanda Forever', 2021, 4, 6.8, 161, 'Ryan Coogler')
;

SELECT * FROM movie;

CREATE TABLE disneyplus(
	disney_ID INTEGER AUTO_INCREMENT NOT NULL,
    title VARCHAR(100),
    year_released YEAR,
    episodes INTEGER,
    imbd_rating DECIMAL(5,2),
    runtime INTEGER,
    CONSTRAINT disneyID_PK PRIMARY KEY (disney_ID)
 );

INSERT INTO disneyplus
(title, year_released, episodes, imbd_rating, runtime)
VALUES
('WandaVision', 2021, 9, 7.9, 350),
('The Falcon and the Winter Soldier', 2021, 6, 7.1, 300),
('Loki', 2021, 6, 8.2, 318),
('Hawkeye', 2021, 6, 7.5, 339),
('Ms. Marvel', 2022, 6, 6.3, 271),
('She-Hulk: Attorney at Law', 2022, 6, 5.3, 210)
;

SELECT * FROM disneyplus;


CREATE TABLE hero (
	hero_ID INTEGER AUTO_INCREMENT NOT NULL,
    name VARCHAR(50),
    alias VARCHAR(50),
    gender VARCHAR(50),
    race VARCHAR(50),
    status VARCHAR(50),
    CONSTRAINT heroID_PK PRIMARY KEY (hero_ID)
);

INSERT INTO hero 
(name, alias, gender, race, status)
VALUES
('Steve Rogers', 'Captain America', 'Male', 'Human', 'Alive'),
('Tony Stark', 'Iron Man', 'Male', 'Human', 'Dead'),
('Bruce Banner', 'Hulk', 'Male', 'Human/ Mutation', 'Alive'),
('Clint Barton', 'Hawkeye', 'Male', 'Human', 'Alive'),
('Natasha Romanoff', 'Black Widow', 'Female', 'Human', 'Dead'),
('Thor Odinson', 'Thor', 'Male', 'Asgardian', 'Alive'),
('Stephen Strange', 'Doctor Strange', 'Male', 'Human', 'Alive'),
('Loki Laufeyson', 'Loki', 'Male', 'Frost Giant', 'Alive'),
('TChalla', 'Black Panther', 'Male', 'Human', 'Dead'),
('Wanda Maximoff', 'Scarlet Witch', 'Female', 'Mutant', 'Alive'),
('Peter Quill', 'Star-Lord', 'Male', 'Human/ Celestial', 'Alive'),
('Peter Parker', 'Spider-Man', 'Male', 'Human', 'Alive'),
('Sam Wilson', 'Falcon', 'Male', 'Human', 'Alive'),
('Bucky Barnes', 'Winter Soldier', 'Male', 'Human', 'Alive'),
('Carol Danvers', 'Captain Marvel', 'Female', 'Human', 'Alive')
;
SELECT * FROM hero;

# -----------------------------ALTER/DROP TABLE----------------------------------- #

# Alter table to insert new column 'eye color', drop 'eye color' column

ALTER TABLE hero
ADD eye_color VARCHAR(50);

SELECT * FROM hero;

ALTER TABLE hero
DROP COLUMN eye_color;

SELECT * FROM hero;

# ---------------------------------------------------------------------------- #

# -----------------------------UPDATE TABLE----------------------------------- #

# Modify the status of Steve Rogers from alive to dead

SET SQL_SAFE_UPDATES = 0; 
UPDATE hero
SET status = 'Dead'
WHERE name = 'Steve Rogers';
SET SQL_SAFE_UPDATES = 1; 
SELECT * FROM hero;

# ---------------------------------------------------------------------------- #

# This table links the disneyplus TV show with the superhero. 

CREATE TABLE disney_hero (
	disney_ID INTEGER,
    hero_ID INTEGER,
    CONSTRAINT disney_IDFK FOREIGN KEY (disney_ID) REFERENCES disneyplus(disney_ID),
    CONSTRAINT hero_IDFK FOREIGN KEY (hero_ID) REFERENCES hero(hero_ID)   
);

# Inserting values into tables and assigning primary and foreign keys to link to parent table

INSERT INTO disney_hero 
(disney_ID, hero_ID)
VALUES
(1,10),
(2,13),
(2,14),
(3,8),
(4,4),
(5,15),
(6,3)
;

SELECT * FROM disney_hero;

 # This table links the MCU movie to the superhero. It will show their first and last appearance in the movies. 
 
CREATE TABLE movie_hero (
	hero_ID INTEGER,
    movie_ID INTEGER,
    appearance VARCHAR(50),
    CONSTRAINT heroIDFK FOREIGN KEY (hero_ID) REFERENCES hero(hero_ID),  
    CONSTRAINT movieIDFK FOREIGN KEY (movie_ID) REFERENCES movie(movie_ID)     
);

# Inserting values into tables and assigning primary and foreign keys to link to parent table

INSERT INTO movie_hero 
(hero_ID, movie_ID, appearance)
VALUES
(1, 5, 'first'),
(1, 22, 'last'),
(2, 1, 'first'),
(2, 22, 'last'),
(3, 2, 'first'),
(3, 22, 'last'),
(4, 4, 'first'),
(4, 22, 'last'),
(5, 3, 'first'),
(5, 24, 'last'),
(6, 4, 'first'),
(6, 22, 'last'),
(7, 14, 'first'),
(7, 28, 'last'),
(8, 4, 'first'),
(8, 22, 'last'),
(9, 13, 'first'),
(9, 22, 'last'),
(10, 11, 'first'),
(10, 28, 'last'),
(11, 10, 'first'),
(11, 22, 'last'),
(12, 13, 'first'),
(12, 23, 'last'),
(13, 9, 'first'),
(13, 22, 'last'),
(14, 9, 'first'),
(14, 22, 'last'),
(15, 21, 'first'),
(15, 22, 'last')
;
SELECT * FROM movie_hero;









