/* ==========================================================
   SQL BASICS – CORE COMMANDS
   Table used in examples: placeofinterest
   Columns (example): name, type, city, country, airport
   ========================================================== */

--------------------------------------------------------------
-- 1. SELECT
-- Syntax:
--   SELECT column1, column2, ...
--   FROM table_name;
--
-- Description:
--   SELECT is used to fetch data (columns) from a table
--   in the database.
--------------------------------------------------------------

-- Example: get all cities from the table
SELECT city
FROM placeofinterest;


--------------------------------------------------------------
-- 2. WHERE
-- Syntax:
--   SELECT column1, column2, ...
--   FROM table_name
--   WHERE condition;
--
-- Description:
--   WHERE filters the rows returned by SELECT based on a
--   specified condition (only rows that satisfy the condition
--   are included).
--------------------------------------------------------------

-- Example: get all rows where the city is 'Rome'
SELECT *
FROM placeofinterest
WHERE city = 'Rome';


--------------------------------------------------------------
-- 3. COUNT
-- Syntax:
--   SELECT COUNT(*)
--   FROM table_name
--   WHERE condition;
--
-- Description:
--   COUNT is an aggregate function that returns how many rows
--   match a condition. It can also count non-NULL values in a
--   specific column.
--------------------------------------------------------------

-- Example: count how many rows are from Canada
SELECT COUNT(country)
FROM placeofinterest
WHERE country = 'Canada';


--------------------------------------------------------------
-- 4. DISTINCT
-- Syntax:
--   SELECT DISTINCT column_name
--   FROM table_name
--   WHERE condition;
--
-- Description:
--   DISTINCT removes duplicate values and returns only unique
--   values for the selected column(s).
--------------------------------------------------------------

-- Example: unique list of countries for historical places
SELECT DISTINCT country
FROM placeofinterest
WHERE type = 'historical';


--------------------------------------------------------------
-- 5. LIMIT
-- Syntax:
--   SELECT *
--   FROM table_name
--   LIMIT number;
--
-- Description:
--   LIMIT restricts how many rows are returned from the query.
--   Helpful when you only want the first N rows.
--------------------------------------------------------------

-- Example: show first 5 rows where airport is 'pearson'
SELECT *
FROM placeofinterest
WHERE airport = 'pearson'
LIMIT 5;


--------------------------------------------------------------
-- 6. INSERT
-- Syntax:
--   INSERT INTO table_name (column1, column2, ...)
--   VALUES (value1, value2, ...);
--
-- Description:
--   INSERT adds new rows into a table.
--------------------------------------------------------------

-- Example: insert a new place
INSERT INTO placeofinterest (name, type, city, country, airport)
VALUES (
    'Niagara Waterfalls',
    'Nature',
    'Toronto',
    'Canada',
    'Pearson'
);


--------------------------------------------------------------
-- 7. UPDATE
-- Syntax:
--   UPDATE table_name
--   SET column1 = value1, column2 = value2, ...
--   WHERE condition;
--
-- Description:
--   UPDATE modifies existing rows in a table. The WHERE clause
--   controls which rows are updated.
--------------------------------------------------------------

-- Example: correct the name for Niagara Falls
UPDATE placeofinterest
SET name = 'Niagara Falls'
WHERE name = 'Niagara Waterfalls';


--------------------------------------------------------------
-- 8. DELETE
-- Syntax:
--   DELETE FROM table_name
--   WHERE condition;
--
-- Description:
--   DELETE removes rows from a table. The WHERE clause decides
--   which rows are deleted.
--------------------------------------------------------------

-- Example: delete places in Rome or Vienna
DELETE FROM placeofinterest
WHERE city IN ('Rome', 'Vienna');
