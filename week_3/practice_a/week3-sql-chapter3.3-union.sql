-- -- --  PART 3 UNION

SELECT first_name, last_name, active, store_id
FROM customer
WHERE store_id IN (1,2)
UNION ALL
SELECT first_name, last_name, active, store_id
FROM customer
WHERE store_id IN (4,5)
LIMIT 5;
