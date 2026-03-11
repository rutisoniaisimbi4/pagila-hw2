SELECT DISTINCT customer.customer_id, customer.first_name, customer.last_name
FROM customer
JOIN rental USING (customer_id)
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
WHERE film.film_id IN (
    SELECT film.film_id
    FROM film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN payment USING (rental_id)
    GROUP BY film.film_id
    ORDER BY SUM(payment.amount) DESC
    LIMIT 5
)
ORDER BY customer.last_name, customer.first_name;
