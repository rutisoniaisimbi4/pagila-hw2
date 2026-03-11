SELECT bts.title
FROM (
    SELECT film.title
    FROM film
    JOIN (SELECT film_id, unnest(special_features) AS feature FROM film) AS f USING (film_id)
    WHERE f.feature = 'Behind the Scenes'
) AS bts
JOIN (
    SELECT film.title
    FROM film
    JOIN (SELECT film_id, unnest(special_features) AS feature FROM film) AS f USING (film_id)
    WHERE f.feature = 'Trailers'
) AS tr ON bts.title = tr.title
ORDER BY bts.title;
