SELECT *
FROM data_analyst_jobs
LIMIT 5;

-- 1. How many rows are in the data_analyst_jobs table?
SELECT	COUNT(*)
FROM data_analyst_jobs;
-- 		A. 5379

-- 2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT *
FROM data_analyst_jobs
LIMIT 10;
-- 		A. ExxonMobil

-- 3A. How many postings are in Tennessee?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN';
-- 		A. 63

-- 3B. How many are there in either Tennessee or Kentucky?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location IN ('TN', 'KY');
-- 		A. 81

