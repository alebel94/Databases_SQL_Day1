-- Week 5 - Monday Questions 
--ALEJANDRO BELTRAN

-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT (last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg';
--Answer: 2

-- Testing for which names
-- SELECT  first_name, last_name
-- FROM actor
-- WHERE last_name LIKE 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT (amount)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;
--Answer: 5607

--If looking for distinct
SELECT COUNT (DISTINCT amount)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;
--Answer: 4


-- 3. What film does the store have the most of? (search in inventory)

-- SELECT film_id, COUNT(inventory_id) AS total
SELECT film_id, COUNT(inventory_id) AS total
FROM inventory
GROUP BY film_id
ORDER BY COUNT(inventory_id) DESC LIMIT 1;
--Answer: film_id = 350, it has 8 (this was the first filtered value)

SELECT film_id, COUNT(inventory_id) AS total
FROM inventory
GROUP BY film_id
HAVING COUNT(inventory_id) = 8;
--Answer: lists all of the ones with 8 films. 72 different film_ids


-- 4. How many customers have the last name ‘William’?

--NO ONE HAS last name William, I think you meant first name
SELECT COUNT(last_name) AS last_name_william
FROM customer
WHERE last_name LIKE 'William';
--Answer: 0

--In case you meant first name
SELECT first_name, last_name --COUNT(last_name) AS last_name_william
FROM customer
WHERE first_name LIKE 'William';
--Answer: 1 = William Satterfield

--In case you meant last name starts with William
SELECT first_name, last_name --COUNT(last_name) AS last_name_william
FROM customer
WHERE last_name LIKE 'William%';
--Answer: 2 = Linda Williams and Gina Williamson


-- 5. What store employee (get the id) sold the most rentals?

SELECT staff_id, COUNT(staff_id) AS rentals_sold
FROM rental
GROUP BY staff_id
ORDER BY COUNT(staff_id) DESC;
--Answer: staff_id 1 had 8040 sold vs staff_id 2 which had 8004


-- 6. How many different district names are there?
SELECT COUNT (district) AS total_districts
FROM address;
--Answer: 603 districts


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT (DISTINCT actor_id) AS actors_in_film
FROM film_actor
GROUP BY film_id
ORDER BY COUNT (actor_id) DESC
--Answer: film_id 508 has 15 actors;


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT last_name, store_id
FROM customer
WHERE last_name LIKE '%es'
AND store_id =1;
--Answer: 13 customers in store 1 where last name ends with 'es'


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT(amount) AS diff_amounts, rental_id
FROM payment
WHERE customer_id BETWEEN 380 AND 430


--Answer:


-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT DISTINCT rating, COUNT(film_id) AS film_count
FROM film
GROUP BY rating
ORDER BY film_count DESC

--Answer: 5 categories with the most being PG-13 at 223 films