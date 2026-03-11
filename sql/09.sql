SELECT feature, COUNT(*) AS num_movies
FROM (
    SELECT unnest(special_features) AS feature FROM film
) AS f
GROUP BY feature
ORDER BY feature;
