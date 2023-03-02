/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT actor.first_name || ' ' || actor.last_name AS "Actor Name"
FROM actor 
WHERE actor.actor_id IN
(SELECT 
    DISTINCT film_actor.actor_id 
FROM film_actor
    INNER JOIN 
    (SELECT film.film_id, unnest(special_features) as special_feature
        FROM film) as f
    ON f.film_id = film_actor.film_id
    WHERE f.special_feature = 'Behind the Scenes')
ORDER BY "Actor Name" ASC;
