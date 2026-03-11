SELECT film.title, SUM(payment.amount) AS revenue
FROM film
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment USING (rental_id)
GROUP BY film.title
ORDER BY revenue DESC;
