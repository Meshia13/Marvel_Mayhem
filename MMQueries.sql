# CFG Intro to Data Challenge
# Author: Carmeshia Lazzana
# Date: August 3, 2023
# Title: Marvel Mayhem 

# This script contains the queries for the Marvel database. It contains demonstrations of the Aggregate functions

USE Marvel;

# -------------------------------- COUNT() ----------------------------------------#

# QUERY: Which director directed the most movies?
# Count(), group by director

SELECT director as Director, 
COUNT(title) as 'Total Directed'
FROM movie
GROUP BY director
ORDER by COUNT(title) desc;


# QUERY: Count the number of directors.

SELECT COUNT(DISTINCT(director)) as 'Number of Directors'
FROM movie;

# -------------------------------- SUM() ----------------------------------------#

# QUERY: Find the total runtime of movies by the phase. Which phase has the highest runtime?
# SUM()

SELECT phase as Phase, 
SUM(runtime) as Runtime
FROM movie
GROUP BY phase
ORDER BY SUM(runtime) desc;  


# -------------------------------- AVG() ----------------------------------------#

# QUERY: Find the average runtime of each phase 
# Round is used to round to the nearest decimal and only returning 2 places after decimal

SELECT phase as Phase,
ROUND(AVG(runtime),2) as Runtime
FROM movie
GROUP BY phase
ORDER BY runtime;

# QUERY: Find the average rating of each phase

SELECT phase,
ROUND(AVG(imbd_rating),2) as Rating
FROM movie
GROUP BY Phase
ORDER BY phase;

# -------------------------------- MAX() ----------------------------------------#

# QUERY: Find the movie and phase with the longest runtime.
SELECT title, 
runtime, 
phase
FROM movie
WHERE runtime IN 
	(SELECT MAX(runtime) 
     FROM movie);

# -------------------------------- MIN() ----------------------------------------#

# QUERY: Find the movie with shortest runtime. 
SELECT title, 
runtime, 
phase
FROM movie
WHERE runtime IN
	(SELECT MIN(runtime) 
    FROM movie)
LIMIT 1;

# QUERY: Find the first character who appeared on screen (by release_ date) and the movie they appeared in.

SELECT alias as Superhero, 
title as Movie,
MIN(year_released) as first_appearance
FROM hero
JOIN movie_hero ON movie_hero.hero_ID = hero.hero_ID 
JOIN movie ON movie.movie_ID = movie_hero.movie_ID
GROUP BY hero.hero_ID, title
ORDER BY first_appearance
LIMIT 1;

# -------------------------------- EXTRA ----------------------------------------#

# Query which character was in the TV show and movies?
# This query involves using a left join on 2 subqueries. The bottom query (right query) finds the characters 
# and the Movies they've appeared in
# The top query (left query) finds the character name, alias and Disneyplus show they've appeared in
# Using the left join returns only characters from Disneyplus Show and Movies they were in
SELECT 
    query1.name, 
    query1.Alias, 
    query2.Movie, 
    query1.Disney
FROM
    (SELECT 
        name AS Name, 
        alias AS Alias, 
        disneyplus.title AS Disney
    FROM
        hero
    JOIN disney_hero ON disney_hero.hero_ID = hero.hero_ID
    JOIN disneyplus ON disneyplus.disney_ID = disney_hero.disney_ID) AS query1
        LEFT JOIN
    (SELECT 
        name, 
        title AS Movie
    FROM
        hero
    JOIN movie_hero ON movie_hero.hero_ID = hero.hero_ID
    JOIN movie ON movie.movie_ID = movie_hero.movie_ID) AS query2 ON 
    query1.name = query2.name
ORDER BY query1.Name;


# QUERY: Determine whether the movie is considered Great, Good, Bad or Horrible based on imbd rating
# Created View and uses conditionals (CASE statement) and return values when conditions are met

CREATE OR REPLACE VIEW VW_Rating
AS    
SELECT title,
imbd_rating,
CASE 
	WHEN imbd_rating >= 8.00 THEN 'Great'
    WHEN imbd_rating <= 7.90 AND  imbd_rating >= 7.00 THEN 'Good'
    WHEN imbd_rating <= 6.90 AND imbd_rating >= 6.50 THEN 'Bad'
    ELSE 'Horrible'
END as 'Rating'
FROM movie
ORDER BY title;

SELECT * 
FROM VW_Rating;

# QUERY: Converting each movies runtime minutes into HH:MM:SS and obtaining longest movie in each phase.
# This query SEC_TO_TIME() to convert the runtime minutes into hours, minutes and seconds. HH:MM:SS. 
# DENSE_RANK() is used to assigns a rank to each row within a partition or result set. 
# The WITH(common table expression) is used to access the subquery and return the number 1 ranked movie by phase.

WITH CTE
AS
(
SELECT 
	phase as Phase, 
	title,
	SEC_TO_TIME(runtime * 60) as Runtime,
    DENSE_RANK() OVER (PARTITION BY
						Phase
                        ORDER BY Runtime DESC ) Phase_rank
FROM movie
 ) 
 SELECT * FROM CTE
 WHERE CTE.Phase_rank = 1;
 
 # QUERY: What disneyplus show had the highest rating and which superhero starred in it?

SELECT title as 'TV Show', 
alias as Hero, 
imbd_rating, 
episodes
FROM hero
JOIN disney_hero on disney_hero.hero_ID = hero.hero_ID
JOIN disneyplus on disneyplus.disney_ID = disney_hero.disney_ID
ORDER BY imbd_rating desc;
 