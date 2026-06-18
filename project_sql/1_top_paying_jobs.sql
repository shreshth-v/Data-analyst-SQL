-- This query retrieves the top 10 highest paying job postings for the position of "Data Analyst" that are located in "Anywhere". It includes the job title, location, schedule type, average yearly salary, posted date, and the company name. The results are ordered by average yearly salary in descending order.
-- (TOP HIGH PAYING JOBS)

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
limit 10;