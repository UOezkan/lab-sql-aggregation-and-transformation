USE sakila;
SHOW TABLES;

# Challenge 1
-- 1.1 Determine the shortest and longest movie durations 
SELECT title, length FROM film
ORDER BY length DESC
LIMIT 10;

SELECT title, length FROM film
ORDER BY length ASC
LIMIT 5;

SELECT MAX(length) AS max_duration, MIN(length) AS min_duration 
FROM film;

-- 1.2. Express the average movie duration in hours and minutes.

SELECT 
  FLOOR(AVG(length) / 60) AS average_hours,  -- Floor for whole hours
  MOD(AVG(length), 60) AS average_minutes   -- Modulo for remaining minutes
FROM film;

-- 2.1 Calculate the number of days that the company has been operating
SELECT * FROM rental ORDER BY rental_date ASC;

SELECT DATEDiff('2006-02-14 15:16:03','2005-05-24 22:53:30') AS nb_days_comp_operating;

SELECT DATEDiff(MAX(rental_date), MIN(rental_date)) as nb_days_comp_operating FROM rental;


-- Challenge 2 
# 1.1 The total number of films that have been released.
SELECT COUNT(*) AS total_films
FROM film;

# 1.2 The total number of films that have been released.
SELECT rating, COUNT(*) AS films_by_rating
FROM film
GROUP BY rating;

# 1.3 The number of films for each rating, sorting the results in descending order of the number of films.
SELECT rating, COUNT(*) AS films_by_rating
FROM film
GROUP BY rating
ORDER BY films_by_rating DESC;



# 2.2

SELECT rating, ROUND(AVG(length), 2) AS average_length
FROM film
GROUP BY rating
HAVING average_length > 120;

# Bonus
SELECT DISTINCT last_name
FROM actor
WHERE last_name NOT IN (
  SELECT last_name
  FROM actor
  GROUP BY last_name
  HAVING COUNT(*) > 1
);

