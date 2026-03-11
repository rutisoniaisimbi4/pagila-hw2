SELECT title
FROM film
WHERE rating = 'G'
AND film_id IN (
    SELECT film_id
    FROM (SELECT film_id, unnest(special_features) AS feature FROM film) AS f
    WHERE feature = 'Trailers'
)
ORDER BY title;
