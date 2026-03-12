SELECT
    EXTRACT(YEAR FROM payment_date) AS "Year",
    EXTRACT(MONTH FROM payment_date) AS "Month",
    ROUND(SUM(amount), 2) AS "Total Revenue"
FROM payment
GROUP BY ROLLUP(
    EXTRACT(YEAR FROM payment_date),
    EXTRACT(MONTH FROM payment_date)
)
ORDER BY 1 NULLS LAST, 2 NULLS LAST;
