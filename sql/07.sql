/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

SELECT DISTINCT film.title
FROM film
INNER JOIN inventory ON inventory.film_id = film.film_id
WHERE inventory.film_id NOT IN
(SELECT inventory.film_id
   FROM inventory
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN customer ON customer.customer_id = rental.customer_id
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id
WHERE country = 'United States')
ORDER BY film.title ASC;

