-- --  PART 3 LEFT JOIN

SELECT first_name, last_name, film_id
FROM actor
LEFT JOIN film_actor ON film_actor.actor_id = actor.actor_id
LIMIT 5;


SELECT first_name, last_name, film_id
FROM actor
RIGHT JOIN film_actor ON film_actor.actor_id = actor.actor_id
LIMIT 5;