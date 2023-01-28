-- --  PART 1 WHERE Conditions

SELECT title, rental_rate
FROM film
WHERE rating > 4
limit 5;

SELECT title, rental_rate
FROM film
WHERE rating = 'PG' AND rental_rate > 4
limit 5;

--  OR
SELECT title, rating
FROM film
WHERE rental_rate =  4.99 OR rental_rate = 2.99
limit 5;

--  IN
SELECT title, rating
FROM film
WHERE rental_rate IN (4.99, 2.99)
limit 5;

SELECT title
FROM film
WHERE title LIKE 'T%'
LIMIT 5;
