SELECT feature AS special_features, COUNT(*) AS count
FROM (
    SELECT unnest(special_features) AS feature FROM film
) AS f
GROUP BY feature
ORDER BY feature;
