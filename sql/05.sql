SELECT actor.first_name, actor.last_name
FROM actor
WHERE (actor.first_name, actor.last_name) NOT IN (
    SELECT first_name, last_name FROM customer
)
ORDER BY actor.last_name, actor.first_name;
