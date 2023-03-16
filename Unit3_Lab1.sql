USE sakila;

#1. List the number of films per category.
SELECT COUNT(film_id) as n_films, category_id
FROM film_category
GROUP BY category_id;

#2. Display the first and the last names, as well as the address, of each staff member.
SELECT st.first_name, st.last_name, ad.address
FROM staff AS st
JOIN address AS ad
ON st.address_id = ad.address_id;

#3. Display the total amount rung up by each staff member in August 2005.
SELECT st.staff_id, st.first_name, st.last_name, SUM(pa.amount) as total_amount
FROM staff AS st
JOIN payment AS pa
ON st.staff_id = pa.staff_id
WHERE pa.payment_date BETWEEN "2005-08-01%" AND "2005-08-31%"
GROUP BY st.staff_id;

#4. List all films and the number of actors who are listed for each film.
SELECT f.title, COUNT(fa.actor_id) as n_actors
FROM film as f
JOIN film_actor as fa
ON f.film_id = fa.film_id
GROUP BY f.title;

#5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT c.customer_id, SUM(p.amount) as total_amount
FROM customer AS c
JOIN payment AS p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

