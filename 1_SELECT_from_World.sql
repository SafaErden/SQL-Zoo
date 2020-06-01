--Introduction
SELECT name, continent, population FROM world

--Large Countries
SELECT name FROM world
WHERE population >200000000

--Per capita GDP
SELECT name, gdp/population  as per_capita FROM world
WHERE population >200000000

--South America In millions
select name,population/1000000 from world where continent = 'South America'

--France, Germany, Italy
select name,population from world where name in ("France","Germany","Italy")

--United
select name from world where name like "%United%"

--Two ways to be big
select name,population,area from world where area>3000000 or population>250000000

--One or the other (but not both)
select name,population,area from world where area>3000000 xor population>250000000

--Rounding
select name,round(population/1000000,2),round(gdp/1000000000,2) from world where continent='South America'

--Trillion dollar economies
select name, round(gdp/population/1000)*1000 from world where gdp > 1000000000000

--Name and capital have the same length
SELECT name, capital
  FROM world
 WHERE LENGTH(name)=LENGTH(capital)

 --Matching name and capital
 SELECT name, capital
FROM world where LEFT(name,1)=LEFT(capital,1) and name<>capital

--All the vowels
SELECT name
   FROM world
WHERE name LIKE '%e%'
  AND name LIKE '%a%'
  AND name LIKE '%i%'
  AND name LIKE '%u%'
  AND name LIKE '%o%'
  AND name NOT LIKE '% %'