SELECT
    RANK() OVER (ORDER BY revenue DESC) AS rank,
    title,
    revenue,
    SUM(revenue) OVER (ORDER BY revenue DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "total revenue"
FROM (
    SELECT film.title, COALESCE(SUM(payment.amount), 0.00) AS revenue
    FROM film
    LEFT JOIN inventory USING (film_id)
    LEFT JOIN rental USING (inventory_id)
    LEFT JOIN payment USING (rental_id)
    GROUP BY film.title
) AS film_revenue
ORDER BY rank, title;
