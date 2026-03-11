SELECT
    title,
    revenue,
    SUM(revenue) OVER (ORDER BY revenue DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "total revenue"
FROM (
    SELECT film.title, SUM(payment.amount) AS revenue
    FROM film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN payment USING (rental_id)
    GROUP BY film.title
) AS film_revenue
ORDER BY revenue DESC;
