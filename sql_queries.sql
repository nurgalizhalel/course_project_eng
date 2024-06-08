# 1a. Select all columns from the actor table (limit to 100 rows).
SELECT * FROM actor
LIMIT 100;

# 1b. Select only last_name from the actor table.
SELECT last_name FROM actor;

# 1c. Select only the following columns from the film table:
#
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# rental_duration       Exists in film table.
# rental_rate           Exists in film table.
# total_rental_cost     rental_duration * rental_rate (you need to multiply two columns to get the required)

SELECT title, film.description, rental_duration, rental_rate, rental_duration * rental_rate AS total_rental_cost FROM film;

# ---------------------------------------------------------#

# 2a. Select different/unique last names from the actor table.
SELECT DISTINCT last_name FROM actor;

# 2b. Select different/unique postal codes from the address table.
SELECT DISTINCT postal_code FROM address;

# 2c. Select different/unique ratings from the film table.
SELECT DISTINCT rating FROM film;
# ---------------------------------------------------------#

# 3a. Select title, description, rating, length columns from film table that are longer than 3 hours or more.
SELECT title, film.description, rating, length FROM film
WHERE length > 180;

# 3b. Select columns payment_id, amount, payment_date from the payment table where payments were made on 05/27/2005 or later.
SELECT payment_id, amount, payment_date FROM payment
WHERE payment_date >= '2005-05-27';

# 3c. Select all columns from the customer table where last names begin with S and first names end with N.
SELECT * FROM customer
WHERE last_name LIKE 'S%' AND first_name LIKE '%N';

# 3d. Select all columns from the customer table where the customer is inactive or has a last name starting with M.
SELECT * FROM customer
WHERE customer.active = 0 OR last_name LIKE 'M%';

# 3e. Select all columns from the category table where the primary key is greater than 4 and the name column begins with C, S, or T.
SELECT * FROM category
WHERE category_id > 4
AND category.name LIKE 'C%' OR category.name LIKE 'S%' OR category.name LIKE 'T%';

# 3f. Select all columns except the password column from the staff table, which contains the value password.
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update  FROM staff;

# ---------------------------------------------------------#

# 4a. Select phone, district columns from the address table that are in California, England, Taipei, or West Java.
SELECT phone, district FROM address
WHERE district  IN ('California', 'England', 'Taipei', 'West Java');


# 4b. Select the payment_id, amount, and payment_date columns from the payment table, where payments were made on 05/25/2005, 05/27/2005, 05/29/2005.
SELECT payment_id, amount, payment_date FROM payment
WHERE YEAR(payment_date) IN (2005) AND MONTH(payment_date) IN (05) AND DAY(payment_date) IN (25,27, 29);

# 4c. Select all columns from the film table where the film's rating is G, PG-13, or NC-17.
SELECT * FROM film
WHERE rating IN ('G', 'PG-13', 'NC-17');

# ---------------------------------------------------------#

# 5a. Select all columns from the payment table where payments were made between 05/25/2005 and 05/26/2005.
SELECT * FROM payment
WHERE payment_date BETWEEN '2005-05-25' AND '2005-05-26';

# 5b. Select only the following columns from the film table, for films whose description length is between 100 and 120:
#
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# release_year          Exists in film table.
# total_rental_cost     rental_duration * rental_rate (you need to multiply two columns to get the required)
SELECT title, film.description, release_year, rental_duration * rental_rate AS total_rental_cost FROM film
WHERE LENGTH(description) BETWEEN 100 AND 120;

# ---------------------------------------------------------#

# 6a. Select only the following columns from the film table where description begins with "A Thoughtful":
# Title, Description, Release Year
SELECT title, description, release_year FROM film
WHERE description LIKE 'A Thoughtful%';

# 6b. Select only the following columns from the film table where description ends with the word "Boat".
# Title, Description, Rental Duration
SELECT title, description, rental_duration FROM film
WHERE description LIKE '%Boat';

# 6c. Select only the following columns from the film table, where description contains the word "Database" and the length of the film is more than 3 hours.
# Title, Length, Description, Rental Rate
SELECT title, length, description, rental_rate FROM film
WHERE description LIKE '%Database%'
AND length > 180;
# ---------------------------------------------------------#

# 7a. Select all columns from the film table and order the rows relative to the length column in ascending order.
SELECT * FROM film
ORDER BY length;

# 7b. Select different (unique) ratings from the film table, sorted by the rating column in descending order.
SELECT DISTINCT rating FROM film
ORDER BY rating DESC;

# 7c. Select columns payment_date, amount from the payment table (first 20 rows) sorted by the amount column in descending order.
SELECT payment_date, amount FROM payment
ORDER BY amount DESC
LIMIT 20;
# ---------------------------------------------------------#

# 8a. Select columns customer first_name/last_name and actor first_name/last_name using /left join/
# between the customer and actor tables (ON first and last names of the corresponding tables)
# Rename the customer first_name/last_name columns as customer_first_name/customer_last_name
# Rename the actor first_name/last_name columns in the same style as above
# Must be 599 lines
SELECT c.first_name AS customer_first_name, c.last_name AS customer_last_name, a.first_name AS actor_first_name, a.last_name AS actor_last_name FROM customer c
LEFT JOIN actor a
ON c.first_name = a.first_name AND c.last_name = a.last_name;

# 8b. Do the same as in 8a, just use /right join/ and look at the difference
# Must be 200 lines
SELECT c.first_name AS customer_first_name, c.last_name AS customer_last_name, a.first_name AS actor_first_name, a.last_name AS actor_last_name FROM customer c
RIGHT JOIN actor a
ON c.first_name = a.first_name AND c.last_name = a.last_name;

# 8c. Select the same columns as in 8a, just use /inner join/ through the last name (without the first name)
# Must be 43 lines
SELECT c.first_name AS customer_first_name, c.last_name AS customer_last_name, a.first_name AS actor_first_name, a.last_name AS actor_last_name FROM customer c
INNER JOIN actor a
ON c.last_name = a.last_name;

# 8d. Select columns city, country from city table using left join with country table.
# Must be 600 lines
SELECT ci.city, co.country
FROM city ci
LEFT JOIN country co
ON ci.country_id = co.country_id;

# 8e. Select the title, description, release_year, and language_name columns from the film table using a left join with the language table.
# Must be 1000 lines
SELECT f.title, f.description, f.release_year, l.name AS language_name
FROM film f
LEFT JOIN language l
ON f.language_id = l.language_id;

# 8f. Select the first_name, last_name, address, address2, city name, district, and postal code columns from the staff table using a 2 left join on the address table and then also on the city table.
# Must be 2 lines
SELECT s.first_name, s.last_name, a.address, a.address2, c.city AS city_name, a.district, a.postal_code
FROM staff s
LEFT JOIN address a
ON s.address_id = a.address_id
LEFT JOIN city c
ON a.city_id = c.city_id;