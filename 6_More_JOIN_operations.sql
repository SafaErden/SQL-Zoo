--1962 movies
SELECT id, title
 FROM movie
 WHERE yr=1962

--When was Citizen Kane released?
select yr from movie where title = "Citizen Kane"

--Star Trek movies
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

--id for actor Glenn Close
SELECT id FROM actor WHERE name='Glenn Close'

--id for Casablanca
SELECT id FROM movie WHERE title='Casablanca'

--Cast list for Casablanca
SELECT actor.name FROM actor 
INNER JOIN casting ON actor.id=casting.actorid WHERE casting.movieid=11768

--Alien cast list
SELECT actor.name FROM actor 
INNER JOIN casting ON casting.actorid=actor.id 
INNER JOIN movie ON movie.id=casting.movieid
WHERE title='Alien'

--Harrison Ford movies
SELECT title FROM movie 
INNER JOIN casting ON movie.id =casting.movieid 
INNER JOIN actor ON casting.actorid=actor.id 
WHERE name LIKE '%Harrison Ford%'

--Harrison Ford as a supporting actor
SELECT title FROM movie 
INNER JOIN casting ON movie.id =casting.movieid 
INNER JOIN actor ON casting.actorid=actor.id 
WHERE name LIKE '%Harrison Ford%' AND casting.ord<>1

--Lead actors in 1962 movies
SELECT title,actor.name FROM movie 
INNER JOIN casting ON movie.id=casting.movieid
INNER JOIN actor ON actor.id=casting.actorid
WHERE yr='1962' AND ord=1

--Busy years for Rock Hudson
SELECT yr, COUNT(title) as number_of_movies FROM
    movie JOIN casting ON movie.id=movieid
          JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
ORDER BY COUNT(title) DESC

--Lead actor in Julie Andrews movies
SELECT title, name FROM movie
JOIN casting x ON movie.id = movieid
JOIN actor ON actor.id =actorid
WHERE ord=1 AND movieid IN
(SELECT movieid FROM casting y
JOIN actor ON actor.id=actorid
WHERE name='Julie Andrews')

--Actors with 15 leading roles
SELECT name
FROM actor JOIN casting
ON id = actorid
AND ord = 1
GROUP BY name
HAVING COUNT(name) >= 15;

--List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title, COUNT(actorid) as cast
FROM movie JOIN casting on id=movieid
WHERE yr = 1978
GROUP BY title
ORDER BY cast DESC, title

--List all the people who have worked with 'Art Garfunkel'.
SELECT distinct actor.name
FROM movie
JOIN casting
ON casting.movieid = movie.id
JOIN actor
ON actor.id = casting.actorid
where movie.id in (select movieid from casting join actor on id =actorid where 
actor.name = 'Art Garfunkel') and actor.name <> 'Art Garfunkel'
