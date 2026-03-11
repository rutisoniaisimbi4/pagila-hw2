SELECT feature, SUM(amount) AS total_profit
FROM (
    SELECT film.film_id, unnest(special_features) AS feature, payment.amount
    FROM film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN payment USING (rental_id)
) AS f
GROUP BY feature
ORDER BY feature;
