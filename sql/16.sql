SELECT
    film.title,
    SUM(payment.amount) AS revenue,
    RANK() OVER (ORDER BY SUM(payment.amount) DESC) AS rank
FROM film
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment USING (rental_id)
GROUP BY film.title
ORDER BY rank;
