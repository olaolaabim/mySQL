-- Basic syntax: SELECT and FROM-- This selecs the year, month snd west columns
SELECT year,
       month,
       west
  FROM tutorial.us_housing_units


-- This selects all the columns 
SELECT *
  FROM tutorial.us_housing_units
  
-- Write a query to select all of the columns in the tutorial.us_housing_units table without using *.
SELECT
  year,
  month,
  month_name,
  west,
  midwest,
  south,
  northeast
FROM
  tutorial.us_housing_units
  
-- Write a query to select all of the columns in tutorial.us_housing_units and rename them so that their first letters are capitalized.
SELECT
  year AS "Year",
  month AS "Month",
  month_name AS "Month Name",
  west AS "West",
  midwest AS "Midwest",
  south AS "South",
  northeast AS "Northeast"
FROM
  tutorial.us_housing_units

-- select and from can be lowercase or uppercase

-- selecting column as new headers
SELECT west AS "West Region"
  FROM tutorial.us_housing_units



-- SQL LIMIT
SELECT *
  FROM tutorial.us_housing_units
 LIMIT 100

-- Write a query that uses the LIMIT command to restrict the result set to only 15 rows.

SELECT
  *
FROM
  tutorial.us_housing_units
LIMIT
  15

-- SQL WHERE 
SELECT *
  FROM tutorial.us_housing_units
 WHERE month = 1

-- SQL Comparison
SELECT *
  FROM tutorial.us_housing_units
 WHERE west > 30
 
 SELECT *
  FROM tutorial.us_housing_units
 WHERE year > 1970
 
 SELECT *
  FROM tutorial.us_housing_units
 WHERE year = 1970
 
 SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name != 'January'

SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name > 'January'
 
SELECT year,
       month,
       west,
       south,
       west + south AS south_plus_west
  FROM tutorial.us_housing_units
  
SELECT year,
       month,
       west,
       south,
       west + south - 4 * year AS nonsense_column
  FROM tutorial.us_housing_units
  
SELECT year,
       month,
       west,
       south,
       (west + south)/2 AS south_west_avg
  FROM tutorial.us_housing_units

-- Did the West Region ever produce more than 50,000 housing units in one month?
SELECT *
  FROM tutorial.us_housing_units
 WHERE west > 50
  
-- Did the South Region ever produce 20,000 or fewer housing units in one month?
SELECT *
  FROM tutorial.us_housing_units
 WHERE south <= 20
  
-- Write a query that only shows rows for which the month name is February.
SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name = 'February'
  
-- Write a query that only shows rows for which the month_name starts with the letter "N" or an earlier letter in the alphabet.
SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name <= 'N'
  
-- Write a query that calculates the sum of all four regions in a separate column.
SELECT
  year,
  MONTH,
  month_name,
  south,
  west,
  midwest,
  northeast,
  south + west + midwest + northeast AS all_regions
FROM
  tutorial.us_housing_units
  
-- Write a query that returns all rows for which more units were produced in the West region than in the Midwest and Northeast combined.
SELECT
  *
FROM
  tutorial.us_housing_units
WHERE
  west > (midwest + northeast)
  
-- Write a query that calculates the percentage of all houses completed in the United States represented by each region. Only return results from the year 2000 and later.
SELECT
  year,
  month,
  month_name,
  west /(west + south + midwest + northeast) * 100 AS west_percent,
  south /(west + south + midwest + northeast) * 100 AS south_percent,
  midwest /(west + south + midwest + northeast) * 100 AS midwest_percent,
  northeast /(west + south + midwest + northeast) * 100 AS northeast_percent
FROM
  tutorial.us_housing_units
WHERE
  year >= 2000


-- SQL Logical Operators
SELECT * FROM tutorial.billboard_top_100_year_end

SELECT *
  FROM tutorial.billboard_top_100_year_end
 ORDER BY year DESC, year_rank
 
-- SQL LIKE  
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" LIKE 'Snoop%'
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist ILIKE 'dr_ke'

-- Write a query that returns all rows for which Ludacris was a member of the group
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist LIKE '%Ludacris'
 
-- Write a query that returns all rows for which the first artist listed in the group has a name that begins with "DJ".
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE 'DJ%'
  
-- SQL IN  

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank IN (1, 2, 3)
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IN ('Taylor Swift', 'Usher', 'Ludacris')

-- Write a query that shows all of the entries for Elvis and M.C. Hammer
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" IN ('M.C. Hammer', 'Hammer', 'Elvis Presley')
  
  
-- SQL BETWEEN  
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank BETWEEN 5 AND 10
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank >= 5 AND year_rank <= 10
 
-- Write a query that shows all top 100 songs from January 1, 1985 through December 31, 1990.
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1985 AND 1990

-- SQL IS NULL  
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IS NULL
 
 -- Write a query that shows all of the rows for which song_name is null.
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE song_name IS NULL
    
-- SQL AND  
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2012 AND year_rank <= 10
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2012
   AND year_rank <= 10
   AND "group" ILIKE '%feat%'
 
-- Write a query that surfaces all rows for top-10 hits for which Ludacris is part of the Group.
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 10
   AND "group" ILIKE '%ludacris%'
  
-- Write a query that surfaces the top-ranked records in 1990, 2000, and 2010.
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank = 1
   AND year IN (1990, 2000, 2010)
  
-- Write a query that lists all songs from the 1960s with "love" in the title.
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year BETWEEN 1960 AND 1969
   AND song_name ilike '%love%'
  
-- SQL OR  
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank = 5 OR artist = 'Gotye'
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND ("group" ILIKE '%macklemore%' OR "group" ILIKE '%timberlake%')
   
-- Write a query that returns all rows for top-10 songs that featured either Katy Perry or Bon Jovi.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank <= 10
AND ("group" ILIKE '%katy perry%' OR "group" ILIKE '%bon jovi%')  

-- Write a query that returns all songs with titles that contain the word "California" in either the 1970s or 1990s.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE song_name LIKE '%California%'
  AND (year BETWEEN 1970 AND 1979 OR year BETWEEN 1990 AND 1999)
  
-- Write a query that lists all top-100 recordings that feature Dr. Dre before 2001 or after 2009.
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%dr. dre%'
   AND (year <= 2000 OR year >= 2010)  
  
-- SQL NOT 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND year_rank NOT BETWEEN 2 AND 3

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND year_rank <= 3

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND "group" NOT ILIKE '%macklemore%'
   
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND artist IS NOT NULL
   
-- Write a query that returns all rows for songs that were on the charts in 2013 and do not contain the letter "a".
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE song_name NOT ILIKE '%a%'
AND year = 2013

-- SQL ORDERBY
SELECT *
  FROM tutorial.billboard_top_100_year_end
 ORDER BY artist
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
 ORDER BY year_rank
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
 ORDER BY year_rank DESC
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 3
 ORDER BY year DESC, year_rank
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 3
 ORDER BY year_rank, year DESC
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 3
 ORDER BY 2, 1 DESC
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2010
 ORDER BY year_rank, artist
 
-- Write a query that returns all rows from 2012, ordered by song title from Z to A.
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2012
 ORDER BY song_name DESC

-- Write a query that returns all rows from 2010 ordered by rank, with artists ordered alphabetically for each song
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2010
 ORDER BY year_rank, artist

-- SQL Comment
SELECT *  -- This comment won't affect the way the code runs
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013

/* Here's a comment so long and descriptive that
it could only fit on multiple lines. Fortunately,
it, too, will not affect how this code runs. */
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
 
-- Write a query that shows all rows for which T-Pain was a group member, ordered by rank on the charts, from lowest to highest rank (from 100 to 1).
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%t-pain%'
 ORDER BY year_rank DESC
  
-- Write a query that returns songs that ranked between 10 and 20 (inclusive) in 1993, 2003, or 2013. Order the results by year and rank, and leave a comment on each line of the WHERE clause to indicate what that line does*/
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year IN (2013, 2003, 1993)  
   AND year_rank BETWEEN 10 AND 20
 ORDER BY year, year_rank