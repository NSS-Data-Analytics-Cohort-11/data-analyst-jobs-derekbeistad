SELECT *
FROM data_analyst_jobs
LIMIT 5;

-- 1. How many rows are in the data_analyst_jobs table?
SELECT	COUNT(*)
FROM indeed_analyst_jobs;
-- 		A. 1793

-- 2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT *
FROM indeed_analyst_jobs
LIMIT 10;
-- 		A. ExxonMobil

-- 3A. How many postings are in Tennessee?
SELECT COUNT(*)
FROM indeed_analyst_jobs
WHERE location = 'TN';
-- 		A. 21

-- 3B. How many are there in either Tennessee or Kentucky?
SELECT COUNT(*)
FROM indeed_analyst_jobs
WHERE location IN ('TN', 'KY');
-- 		A. 27

-- 4. How many postings in Tennessee have a star rating above 4?
SELECT COUNT(*)
FROM indeed_analyst_jobs
WHERE location ILIKE 'TN'
AND star_rating > 4;
-- 		A. 3

-- 5. How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(*)
FROM indeed_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
-- 		A. 151

-- 6. Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
SELECT location AS state, AVG(star_rating) AS avg_rating
FROM indeed_analyst_jobs
GROUP BY location
ORDER BY AVG(star_rating) DESC;
-- 		A. NE

-- 7A. Select unique job titles from the data_analyst_jobs table.
SELECT DISTINCT title
FROM indeed_analyst_jobs;

-- 7B. How many are there?
SELECT COUNT(DISTINCT title)
FROM indeed_analyst_jobs;
-- 		A. 881

-- 8. How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT title)
FROM indeed_analyst_jobs
WHERE location = 'CA';
-- 		A. 230

-- 9A. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations.
SELECT company, AVG(star_rating) AS avg_rating
FROM indeed_analyst_jobs
WHERE review_count > 5000
GROUP BY company;

-- 9B. How many companies are there with more that 5000 reviews across all locations?
SELECT COUNT(DISTINCT company)
FROM indeed_analyst_jobs
WHERE review_count > 5000;
-- 		A. 40

-- 10A. Add the code to order the query in #9 from highest to lowest average star rating. 
SELECT company, AVG(star_rating) AS avg_rating
FROM indeed_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_rating DESC, company;

-- 10B. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT company, AVG(star_rating) AS avg_rating
FROM indeed_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_rating DESC, company
LIMIT 6;
-- 		A. 6 way tie at 4.199 for Kaiser, Microsoft, Unilever, AMEX, GM, and Nike

-- 11A. Find all the job titles that contain the word ‘Analyst’. 
SELECT title
FROM indeed_analyst_jobs
WHERE title ILIKE '%analyst%';

-- 11B. How many different job titles are there?
SELECT COUNT(DISTINCT title)
FROM indeed_analyst_jobs
WHERE title ILIKE '%analyst%';
-- 		A. 774

-- 12A. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’?
SELECT DISTINCT title
FROM indeed_analyst_jobs
WHERE title NOT ILIKE '%analyst%'
AND title NOT ILIKE '%analytics%';
-- 		A. 4

-- 12B. What word do these positions have in common?
-- 		A. 'Tableau'
SELECT DISTINCT title
FROM indeed_analyst_jobs
WHERE title ILIKE '%tableau%';

-- BONUS. You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
SELECT domain, COUNT(title)
FROM indeed_analyst_jobs
WHERE skill ILIKE '%sql%'
AND days_since_posting > (7*3)
AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(title) DESC;

--  - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
SELECT domain, COUNT(title)
FROM indeed_analyst_jobs
WHERE skill ILIKE '%sql%'
AND days_since_posting > (7*3)
AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(title) DESC
LIMIT 4;