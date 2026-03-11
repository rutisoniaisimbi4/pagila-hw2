SELECT
    EXTRACT(YEAR FROM rental_date) AS year,
    EXTRACT(MONTH FROM rental_date) AS month,
    COUNT(*) AS total_rentals
FROM rental
GROUP BY ROLLUP(
    EXTRACT(YEAR FROM rental_date),
    EXTRACT(MONTH FROM rental_date)
)
ORDER BY year, month;
