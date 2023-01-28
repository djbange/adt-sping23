-- -- --  PART 2 Aggregate

SELECT SUM(amount)  --  should be 67416
FROM payment;

SELECT SUM(amount)  as total_amount
FROM payment;

--  COUNT
SELECT COUNT(film_id) --  should be 4581
FROM inventory;

SELECT COUNT(DISTINCT film_id) --  should be 958
FROM inventory;

--  MIN MAX

SELECT MIN(amount)  
FROM payment;

SELECT MAX(amount)  --  did you get 11.99?
FROM payment;

SELECT AVG(amount)  --  did you get 4.2?
FROM payment;



