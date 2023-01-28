-- PART 1
-- Remember you need to select the query you are executing, then query > execute (or icon - lightning strike)
SELECT
	actor_id,
	first_name
FROM
	actor;

-- Select 5 TOP names
SELECT
	last_name
FROM
	actor
LIMIT
	5;

--Count how many rows - should be 200
SELECT
	count(*)
FROM
	actor;

-- What is 5% from 200? Should be 2.5
SELECT
	(5 / 200) * 100;

-- we can select 3 top records - about 5%
SELECT
	last_name
FROM
	actor
LIMIT
	3;

-- What are unique first names?
SELECT
	DISTINCT first_name
FROM
	actor;

-- Add ALIAS
SELECT
	first_name AS actor_name
FROM
	actor;