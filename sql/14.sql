SELECT
    EXTRACT(YEAR FROM rental.rental_date)::int AS "Year",
    EXTRACT(MONTH FROM rental.rental_date)::int AS "Month",
    SUM(payment.amount) AS "Total Revenue"
FROM rental
JOIN payment
    ON payment.rental_id = rental.rental_id
GROUP BY ROLLUP(
    EXTRACT(YEAR FROM rental.rental_date),
    EXTRACT(MONTH FROM rental.rental_date)
)
ORDER BY 1 NULLS LAST, 2 NULLS LAST;
