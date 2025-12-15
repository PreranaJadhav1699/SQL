/* ============================================================
   SQL CHEAT SHEET – FUNCTIONS, SUBQUERIES & IMPLICIT JOINS
   Database: MySQL / DB2
   Example tables: employees, jobs
   ============================================================ */

---------------------------------------------------------------
-- 1. COUNT
-- Used to return the number of rows that match a condition.

-- Syntax:
-- SELECT COUNT(column_name)
-- FROM table_name
-- WHERE condition;

-- Example:
SELECT COUNT(dep_id)
FROM employees;

---------------------------------------------------------------
-- 2. AVG
-- Returns the average value of a numeric column.

-- Syntax:
-- SELECT AVG(column_name)
-- FROM table_name
-- WHERE condition;

-- Example:
SELECT AVG(salary)
FROM employees;

---------------------------------------------------------------
-- 3. SUM
-- Returns the total sum of values in a numeric column.

-- Syntax:
-- SELECT SUM(column_name)
-- FROM table_name
-- WHERE condition;

-- Example:
SELECT SUM(salary)
FROM employees;

---------------------------------------------------------------
-- 4. MIN
-- Returns the smallest value from the selected column.

-- Syntax:
-- SELECT MIN(column_name)
-- FROM table_name
-- WHERE condition;

-- Example:
SELECT MIN(salary)
FROM employees;

---------------------------------------------------------------
-- 5. MAX
-- Returns the largest value from the selected column.

-- Syntax:
-- SELECT MAX(column_name)
-- FROM table_name
-- WHERE condition;

-- Example:
SELECT MAX(salary)
FROM employees;

---------------------------------------------------------------
-- 6. ROUND
-- Rounds a numeric value to a specified number of decimal places.

-- Syntax:
-- SELECT ROUND(number, decimals, operation);

-- Example:
SELECT ROUND(salary)
FROM employees;

---------------------------------------------------------------
-- 7. LENGTH
-- Returns the length of a string (in bytes).

-- Syntax:
-- SELECT LENGTH(column_name)
-- FROM table;

-- Example:
SELECT LENGTH(f_name)
FROM employees;

---------------------------------------------------------------
-- 8. UCASE
-- Converts text values to uppercase.

-- Syntax:
-- SELECT UCASE(column_name)
-- FROM table;

-- Example:
SELECT UCASE(f_name)
FROM employees;

---------------------------------------------------------------
-- 9. LCASE
-- Converts text values to lowercase.

-- Syntax:
-- SELECT LCASE(column_name)
-- FROM table;

-- Example:
SELECT LCASE(f_name)
FROM employees;

---------------------------------------------------------------
-- 10. DISTINCT
-- Returns unique values and removes duplicates.

-- Syntax:
-- SELECT DISTINCT column_name
-- FROM table;

-- Example:
SELECT DISTINCT UCASE(f_name)
FROM employees;

---------------------------------------------------------------
-- 11. DAY
-- Extracts the day value from a date.

-- Syntax:
-- SELECT DAY(date_column)
-- FROM table;

-- Example:
SELECT DAY(b_date)
FROM employees
WHERE emp_id = 'E1002';

---------------------------------------------------------------
-- 12. CURRENT_DATE
-- Returns the current system date.

-- Syntax:
-- SELECT CURRENT_DATE;

-- Example:
SELECT CURRENT_DATE;

---------------------------------------------------------------
-- 13. DATEDIFF
-- Calculates the difference between two dates in days.

-- Syntax:
-- SELECT DATEDIFF(date1, date2);

-- Example:
SELECT DATEDIFF(CURRENT_DATE, date_column)
FROM table;

---------------------------------------------------------------
-- 14. FROM_DAYS
-- Converts number of days into YYYY-MM-DD date format.

-- Syntax:
-- SELECT FROM_DAYS(number_of_days);

-- Example:
SELECT FROM_DAYS(DATEDIFF(CURRENT_DATE, date_column))
FROM table;

---------------------------------------------------------------
-- 15. DATE_ADD
-- Adds a specific time interval to a date.

-- Syntax:
-- SELECT DATE_ADD(date, INTERVAL n type);

-- Example:
SELECT DATE_ADD(date, INTERVAL 3 DAY);

---------------------------------------------------------------
-- 16. DATE_SUB
-- Subtracts a specific time interval from a date.

-- Syntax:
-- SELECT DATE_SUB(date, INTERVAL n type);

-- Example:
SELECT DATE_SUB(date, INTERVAL 3 DAY);

---------------------------------------------------------------
-- 17. SUBQUERY
-- A query inside another query, usually used in WHERE clause.

-- Example 1:
SELECT emp_id, f_name, l_name, salary
FROM employees
WHERE salary < (
    SELECT AVG(salary)
    FROM employees
);

-- Example 2:
SELECT *
FROM (
    SELECT emp_id, f_name, l_name, dep_id
    FROM employees
) AS emp4all;

-- Example 3:
SELECT *
FROM employees
WHERE job_id IN (
    SELECT job_ident
    FROM jobs
);

---------------------------------------------------------------
-- 18. IMPLICIT INNER JOIN
-- Returns only matching records from both tables.

-- Syntax:
-- SELECT column_name(s)
-- FROM table1, table2
-- WHERE table1.column_name = table2.column_name;

-- Example:
SELECT *
FROM employees, jobs
WHERE employees.job_id = jobs.job_ident;

---------------------------------------------------------------
-- 19. IMPLICIT CROSS JOIN
-- Returns Cartesian product of both tables.

-- Syntax:
-- SELECT column_name(s)
-- FROM table1, table2;

-- Example:
SELECT *
FROM employees, jobs;

---------------------------------------------------------------

