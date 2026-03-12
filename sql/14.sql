SELECT
    EXTRACT(YEAR FROM payment_date) AS "Year",
    EXTRACT(MONTH FROM payment_date) AS "Month",
    SUM(amount) AS "Total Revenue"
FROM payment
GROUP BY ROLLUP(
    EXTRACT(YEAR FROM payment_date),
    EXTRACT(MONTH FROM payment_date)
)
ORDER BY "Year", "Month";
