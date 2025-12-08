Relational Model Constraints

1. Entity Integrity

Goal: Every row in a table must be uniquely identifiable.

Rules:

Table must have a PRIMARY KEY

Primary key values must be:

Unique

NOT NULL

Example:

CREATE TABLE BookShop (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(100),
    AUTHOR_ID INT
);

BOOK_ID uniquely identifies each book.

No duplicate or missing BOOK_ID is allowed.

2. Referential Integrity

Goal: Keep relationships between tables valid.

Rules:

A FOREIGN KEY in one table must match an existing PRIMARY KEY in another table.

Prevents “orphan” records that point to non-existent rows.

Example:

CREATE TABLE BookShop_AuthorDetails (
    AUTHOR_ID INT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(100)
);

CREATE TABLE BookShop (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(100),
    AUTHOR_ID INT,
    FOREIGN KEY (AUTHOR_ID) REFERENCES BookShop_AuthorDetails(AUTHOR_ID)
);


Every AUTHOR_ID in BookShop must exist in BookShop_AuthorDetails.

Inserting a book with an unknown AUTHOR_ID will fail.

3. Domain Integrity

Goal: Ensure values in a column are valid and within an allowed domain.

Covers:

Data type

Range / allowed values

Format

Null allowed or not

Example:

CREATE TABLE BookShop (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(100) NOT NULL,
    PRICE DECIMAL(5, 2) CHECK (PRICE >= 0),
    PUBLISHED_DATE DATE
);

TITLE is NOT NULL → every book must have a title.

PRICE uses CHECK (PRICE >= 0) → price cannot be negative.

PUBLISHED_DATE must be a valid DATE.


SQL Scripts – Uses and Applications

A SQL script is a file (usually .sql) containing multiple SQL commands that are executed together.

Why use SQL scripts?

Automate database setup and changes

Run multiple DDL/DML statements in sequence

Reuse the same steps across environments (dev, test, prod)

Each command in a script is usually terminated with ;.

Common Things You Do with SQL Scripts
    
1. Create tables
CREATE TABLE BookShop (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(100),
    AUTHOR_ID INT
);

2. Drop tables
DROP TABLE BookShop;


Often used before a CREATE TABLE to avoid “table already exists” errors (in non-production environments).

3. Insert data
INSERT INTO BookShop (BOOK_ID, TITLE, AUTHOR_ID)
VALUES (1, 'Data Engineering 101', 10);

4. Update data
UPDATE BookShop
SET TITLE = 'Advanced Data Engineering'
WHERE BOOK_ID = 1;

5. Delete data
DELETE FROM BookShop
WHERE BOOK_ID = 1;

6. Create views
CREATE VIEW vw_BookWithAuthor AS
SELECT b.BOOK_ID,
       b.TITLE,
       a.AUTHOR_NAME
FROM BookShop b
JOIN BookShop_AuthorDetails a
  ON b.AUTHOR_ID = a.AUTHOR_ID;

Views simplify complex joins and provide a cleaner way to query data.

7. Stored procedures & triggers (concept level)

Stored procedures: saved SQL programs you can execute with a call.

Triggers: special procedures that run automatically when INSERT, UPDATE, or DELETE happens on a table.
