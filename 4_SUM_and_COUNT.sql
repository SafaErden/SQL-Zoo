--Total world population
SELECT SUM(population)
FROM world

--List of continents
select continent from world group by continent

--GDP of Africa
select sum(gdp) from world where continent="Africa"

--Count the big countries
select count(name) from world where area>1000000

--Baltic states population
select sum(population) from world where name in('Estonia', 'Latvia', 'Lithuania')

--Using GROUP BY and HAVING
SELECT continent,count(name) from world group by continent

--Counting big countries in each continent
select continent,count(name) from world where population>10000000 group by continent

--Counting big continents
select continent from world  group by continent  having sum(population)>100000000 
