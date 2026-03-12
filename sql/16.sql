SELECT
    RANK() OVER (ORDER BY SUM(payment.amount) DESC NULLS LAST) AS rank,
    film.title,
    COALESCE(SUM(payment.amount), 0.00) AS revenue
FROM film
LEFT JOIN inventory USING (film_id)
LEFT JOIN rental USING (inventory_id)
LEFT JOIN payment USING (rental_id)
GROUP BY film.title
ORDER BY rank, film.title;
