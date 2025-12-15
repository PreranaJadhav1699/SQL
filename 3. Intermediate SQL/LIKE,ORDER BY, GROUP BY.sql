LIKE, BETWEEN, ORDER BY, GROUP BY, HAVING

--------------------------------------------------------------------------------------------------------

🔹 LIKE

Used in the WHERE clause to search for patterns in a column.

- Commonly used with wildcards:

- % → matches any number of characters

- _ → matches exactly one character

Useful when you don’t know the exact value but know part of it.

Syntax:

SELECT column1, column2
FROM table_name
WHERE column_name LIKE pattern;

Example:

SELECT f_name, l_name
FROM employees
WHERE address LIKE '%Elgin,IL%';

Returns all employees whose address contains Elgin, IL.

---------------------------------------------------------------------------------------------------------

🔹 BETWEEN

- Used to select values within a specific range.

- Can be applied to numbers, dates, or text.

- The range is inclusive (start and end values are included).

Syntax:

SELECT column_name
FROM table_name
WHERE column_name BETWEEN value1 AND value2;

Example:

SELECT *
FROM employees
WHERE salary BETWEEN 40000 AND 80000;

Returns employees with salaries between 40,000 and 80,000.

----------------------------------------------------------------------------------------------------------

🔹 ORDER BY

- Used to sort query results.

- Default sorting is ascending (ASC).

- Can also sort in descending (DESC) order.

- Multiple columns can be used for sorting.

Syntax:

SELECT column1, column2
FROM table_name
ORDER BY column1 ASC|DESC, column2 ASC|DESC;

Example:

SELECT f_name, l_name, dep_id
FROM employees
ORDER BY dep_id DESC, l_name;

First sorts by department ID (descending).

Then sorts by last name (alphabetical).

----------------------------------------------------------------------------------------------------------

🔹 GROUP BY

- Used to group rows that have the same values.

- Commonly used with aggregate functions like:

COUNT()

SUM()

AVG()

MIN()

MAX()

- Helps in generating summary reports.

Syntax:

SELECT column_name, aggregate_function(column)
FROM table_name
GROUP BY column_name;

Example:

SELECT dep_id, COUNT(*)
FROM employees
GROUP BY dep_id;

Returns each department ID with the number of employees in that department.

------------------------------------------------------------------------------------------------------------------

🔹 HAVING

Used with GROUP BY to filter grouped results.

Similar to WHERE, but:

WHERE filters rows

HAVING filters groups

Often used with aggregate functions.

Syntax:

SELECT column_name, aggregate_function(column)
FROM table_name
GROUP BY column_name
HAVING condition;

Example:

SELECT dep_id,
       COUNT(*) AS num_employees,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY dep_id
HAVING COUNT(*) < 4
ORDER BY avg_salary;

Shows departments that have less than 4 employees.

Results are ordered by average salary.