/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT final.title FROM
((SELECT f.title as film_title FROM 
(SELECT film.title, unnest(special_features) as spec FROM film) as f
WHERE f.spec = 'Behind the Scenes') as bts
INNER JOIN
(SELECT h.title FROM
(SELECT film.title, unnest(special_features) as spec FROM film) as h
WHERE h.spec = 'Trailers') as trailer
ON trailer.title = bts.film_title) as final
ORDER BY title ASC;
