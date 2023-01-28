-- --  PART 1 ORDER and FILTER
--  Ascending order
SELECT title, release_year
FROM film
ORDER BY release_year
LIMIT 5;   --  use limit to prevent printing the entire table

--  Descending order
SELECT title, release_year
FROM film
ORDER BY release_year DESC, title ASC
LIMIT 5;

--  Conditions
SELECT customer_id, amount
FROM payment
WHERE amount < 5
LIMIT 5;

SELECT customer_id, amount
FROM payment
WHERE amount <> 0.99 --  not equal
LIMIT 5;

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 1 and 3 
LIMIT 5;

SELECT customer_id, amount
FROM payment
WHERE amount NOT BETWEEN 1 and 3 
LIMIT 5;

-- --  NULL VALUES

select *   --  gives you idea of data
FROM film
LIMIT 5;


SELECT title
FROM film
WHERE original_language_id IS NULL
LIMIT 5;

SELECT title
FROM film
WHERE description IS NOT NULL
LIMIT 5;   


