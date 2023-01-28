-- --  PART 3 JOIN

SELECT first_name, last_name, rental_id
FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
LIMIT 5;

SELECT first_name, last_name, payment.rental_id, amount
FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
INNER JOIN rental ON payment.rental_id = rental.rental_id
LIMIT 5;