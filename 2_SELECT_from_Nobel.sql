--Winners from 1950
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

--1962 Literature
 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject= 'Literature'

--Albert Einstein
select yr, subject from nobel where winner ="Albert Einstein"

--Recent Peace Prizes
select winner from nobel where subject='Peace' and yr>=2000

--Literature in the 1980's
select * from nobel where yr>=1980 and yr<=1989 and subject="Literature"

--Only Presidents
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

--John
select winner from nobel where winner like "John%"

--Chemistry and Physics from different years
select yr, subject, winner from nobel where (subject="Physics" and yr=1980) or (subject="Chemistry" and yr=1984)

--Exclude Chemists and Medics
select yr, subject, winner from nobel where subject<>"Chemistry" and subject<>"Medicine" and yr=1980

--Early Medicine, Late Literature
select yr, subject, winner from nobel where (subject="Medicine" and yr<1910) or (subject="Literature" and yr>=2004)

--Harder Questions
select * from nobel where winner="PETER GRÜNBERG"

--Apostrophe
select * from nobel where winner="EUGENE O\'NEILL"

--Knights of the realm
select winner, yr,subject from nobel where winner like "Sir%"

--Chemistry and Physics last
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject,winner