USE sakila;

-- q1 How many films are there for each of the categories in the category table.
-- Use appropriate join to write this query.

SELECT c.category_id,c.name, COUNT(f.film_id) AS "number of films"
FROM sakila.film_category f
JOIN sakila.category c
ON f.category_id = c.category_id
GROUP BY c.name, c.category_id
ORDER BY c.category_id ASC;

-- q2 Display the total amount rung up by each staff member in August of 2005.

SELECT s.staff_id,s.first_name, s.last_name, SUM(p.amount)
FROM sakila.payment p
JOIN sakila.staff s
ON p.staff_id = s.staff_id
WHERE YEAR(p.payment_date) = 2005 AND MONTH(p.payment_date) = 8
GROUP BY s.staff_id,s.first_name, s.last_name
ORDER BY SUM(p.amount) DESC;

-- q3 Which actor has appeared in the most films? GINA DEGENERES

SELECT a.first_name, a.last_name, f.actor_id, COUNT(f.actor_id) AS 'number of movies' FROM sakila.film_actor f
JOIN sakila.actor a
ON a.actor_id=f.actor_id
GROUP BY a.actor_id
ORDER BY COUNT(f.actor_id) DESC
LIMIT 1;

-- q4 Most active customer (the customer that has rented the most number of films)

SELECT r.customer_id,c.first_name, c.last_name, count(r.customer_id) AS 'number of total rentals'
FROM sakila.rental r
JOIN sakila.customer c
ON r.customer_id = c.customer_id
Group by r.customer_id
ORDER BY COUNT(r.customer_id) DESC
LIMIT 1;

-- q5 Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, s.address_id, a.address  FROM staff s
JOIN address a
ON s.address_id = a.address_id;

-- q6 List each film and the number of actors who are listed for that film.
-- SELECT * FROM film_actor;
-- SELECT * FROM film;

SELECT fa.film_id,f.title, count(fa.actor_id) AS "number of actors listed per film"
FROM film_actor fa
JOIN film f
ON f.film_id = fa.film_id
GROUP BY fa.film_id;

-- q7 Using the tables payment and customer and the JOIN command,
-- list the total paid by each customer. List the customers alphabetically by last name.
-- SELECT * FROM payment;
-- SELECT * FROM customer;

SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) FROM customer c
JOIN payment p
ON c.customer_id= p.customer_id
GROUP BY p.customer_id
ORDER BY c.last_name ASC;

-- q8 List number of films per category.
SELECT c.category_id,c.name, COUNT(f.film_id) AS "number of films"
FROM sakila.film_category f
JOIN sakila.category c
ON f.category_id = c.category_id
GROUP BY c.name, c.category_id
ORDER BY c.category_id ASC;
-- ??? ISN'T Q8 SAME AS THE Q1 ???
