SELECT
    title,
    revenue,
    SUM(revenue) OVER (ORDER BY revenue DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "total revenue",
    to_char(
        100.0 * SUM(revenue) OVER (ORDER BY revenue DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
        / SUM(revenue) OVER (),
        '999.99'
    ) AS "revenue percent"
FROM (
    SELECT film.title, SUM(payment.amount) AS revenue
    FROM film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN payment USING (rental_id)
    GROUP BY film.title
) AS film_revenue
ORDER BY revenue DESC;
