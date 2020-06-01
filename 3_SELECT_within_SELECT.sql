--Bigger than Russia
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

--Richer than UK
SELECT name FROM world
  WHERE continent="Europe" and  GDP/population>
     (SELECT GDP/population FROM world
      WHERE name='United Kingdom')

--Neighbours of Argentina and Australia
select name, continent from world where continent in (select continent from world where name in("Argentina ","Australia")) order by name

--Between Canada and Poland
select name from world where population > (select population from world where name="Canada ") and population < (select population from world where name="Poland")

--Percentages of Germany
select name, concat(round(population/(select population from world where name="Germany")*100),"%") as percent from world where continent="Europe"

--Bigger than every country in Europe
select name from world where gdp > all(select gdp from world where gdp > 0 and continent='Europe')

--Largest in each continent
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND population>0)

--First country of each continent (alphabetically)
select continent,name from world x where name <= all(select name from world y where x.continent=y.continent)

--Difficult Questions That Utilize Techniques Not Covered In Prior Sections
SELECT name, continent, population FROM world x
  WHERE 25000000>=ALL (SELECT population FROM world y
                         WHERE x.continent=y.continent
                         AND population>0)

--Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent from world x where x.population/3> ALL(SELECT population FROM world y
                         WHERE x.continent=y.continent
                         AND population>0 AND x.name<>y.name)


