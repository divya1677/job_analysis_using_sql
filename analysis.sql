-- Total number of job postings
SELECT COUNT(*) AS total_jobs
FROM jobs;

-- View sample top 5 records
SELECT *
FROM jobs
LIMIT 5;

️-- Location-based analysis
-- City-wise job count
SELECT location, COUNT(*) AS job_count
FROM jobs
GROUP BY location
ORDER BY job_count DESC;

-- Remote vs Onsite job distribution
SELECT
    CASE
        WHEN remote_allowed = 1 THEN 'Remote'
        ELSE 'Onsite'
    END AS job_type,
    COUNT(*) AS total_jobs
FROM jobs
GROUP BY remote_allowed;

-- Average salary by job role
SELECT
    title,
    ROUND(AVG((min_salary + max_salary) / 2)) AS avg_salary
FROM jobs
GROUP BY title
ORDER BY avg_salary DESC;

-- Top 5 highest paying job roles
SELECT title, location, max_salary
FROM jobs
ORDER BY max_salary DESC
LIMIT 5;

-- Full-time vs Contract jobs
SELECT work_type, COUNT(*) AS total_jobs
FROM jobs
GROUP BY work_type;
