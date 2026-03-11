SELECT film.film_id, film.title
FROM film
LEFT JOIN inventory USING (film_id)
WHERE inventory.inventory_id IS NULL
ORDER BY film.title;
