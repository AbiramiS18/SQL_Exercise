-- 4.1 Select the title of all movies.
SELECT Title FROM movies;

-- 4.2 Show all the distinct ratings in the database.
SELECT DISTINCT rating FROM movies;

-- 4.3 Show all unrated movies.
SELECT title FROM movies
WHERE rating IS NULL;

-- 4.4 Select all movie theaters that are not currently showing a movie.
SELECT name FROM movietheaters
WHERE movie IS NULL;

-- 4.5
-- Select all data from all movie theaters 
-- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
SELECT * FROM Movietheaters mt JOIN
Movies m on mt.movie = m.code;

-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
SELECT * FROM Movies m LEFT JOIN 
movietheaters mt on m.code = mt.movie;

-- 4.7 Show the titles of movies not currently being shown in any theaters.
SELECT m.title FROM movies m RIGHT JOIN 
movietheaters mt on m.code = mt.movie
WHERE mt.movie IS NULL; 

-- 4.8 Add the unrated movie "One, Two, Three".
INSERT INTO movies (code,title) VALUES (9,"One Two Three");

-- 4.9 Set the rating of all unrated movies to "G".
UPDATE movies
SET rating = "G" WHERE rating IS NULL;

-- 4.10 Remove movie theaters projecting movies rated "NC-17".
DELETE mt FROM movietheaters mt JOIN
movies m on mt.movie = m.code
WHERE rating = "NC-17";

