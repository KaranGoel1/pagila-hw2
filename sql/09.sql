/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT f.special_features, COUNT(*)
FROM (SELECT unnest(special_features) as special_features FROM film) as f
GROUP BY f.special_features
ORDER BY f.special_features ASC;
