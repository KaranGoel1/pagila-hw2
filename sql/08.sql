/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT f.title
FROM 
(SELECT film.title, unnest(special_features) as spec, film.rating FROM film) as f
WHERE spec = 'Trailers'
AND f.rating = 'G'
ORDER BY f.title ASC; 
