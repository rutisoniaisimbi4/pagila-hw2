SELECT DISTINCT film.title
FROM film
JOIN inventory USING (film_id)
LEFT JOIN (
    SELECT rental.inventory_id
    FROM rental
    JOIN customer USING (customer_id)
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN country USING (country_id)
    WHERE country.country = 'United States'
) AS us_rentals ON inventory.inventory_id = us_rentals.inventory_id
WHERE us_rentals.inventory_id IS NULL
ORDER BY film.title;
