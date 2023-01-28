-- -- --  PART 2 Group By and HAVING

SELECT rating, COUNT(title) as titles_count
FROM film
GROUP BY rating;

SELECT rating, COUNT(title) as titles_count
FROM film
WHERE rental_rate > 4
GROUP BY rating;

SELECT rating, COUNT(title) as titles_count
FROM film
WHERE rental_rate > 4
GROUP BY rating
HAVING COUNT(title) > 70;