USE sakila;

# 1. Drop column picture from staff.
ALTER TABLE staff DROP COLUMN picture;

# 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * FROM customer WHERE first_name='Tammy';

SELECT * FROM staff LIMIT 5;

INSERT INTO staff VALUES(3,'Tammy','Sanders',79,'Tammy.Sanders@sakilacustomer.org',2,1,'Tammy',null,'2023-02-25 12:00:00');

SELECT * FROM staff;

# 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table.
SELECT * FROM rental ORDER BY rental_id DESC Limit 1;

SELECT customer_id FROM customer
WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER';

SELECT film_id FROM film
WHERE title = 'Academy Dinosaur';

SELECT inventory_id FROM inventory
WHERE film_id=1 AND store_id=1;

SELECT staff_id FROM staff
WHERE first_name='Mike' AND last_name='Hillyer';

INSERT INTO rental VALUES(16050,'2023-02-25 14:48:00',1,130,null,1,'2023-02-25 12:50:00');

SELECT * FROM rental WHERE rental_id=16050;

# 4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted.

# Check if there are any non-active users
SELECT DISTINCT active from customer;

# Create a table backup table as suggested
SELECT * FROM customer WHERE active=0;

DESCRIBE customer;

CREATE TABLE backup_table AS
SELECT *
FROM customer
WHERE 1=0;

# Insert the non active users in the table backup table
INSERT INTO backup_table 
SELECT * FROM customer WHERE active=0;

SELECT * FROM backup_table;

# Delete the non active users from the table customer
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM customer WHERE active=0;
SELECT * FROM customer WHERE active=0;
SET FOREIGN_KEY_CHECKS=1;