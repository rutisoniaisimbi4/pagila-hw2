SELECT
    EXTRACT(YEAR FROM payment_date) AS year,
    EXTRACT(MONTH FROM payment_date) AS month,
    SUM(amount) AS total_revenue
FROM payment
GROUP BY ROLLUP(
    EXTRACT(YEAR FROM payment_date),
    EXTRACT(MONTH FROM payment_date)
)
ORDER BY year, month;
