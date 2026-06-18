-- This query retrieves the top 25 skills in demand for Data Analyst positions that offer work-from-home options. It calculates the number of job postings for each skill and the average salary for those postings, filtering out skills with fewer than 10 job postings. The results are ordered by average salary in descending order, followed by demand count in descending order.
-- (SKILLS WITH MOST JOB POSTINGS AND HIGHEST AVERAGE SALARY)

SELECT 
    skills_dim.skill_id,
    skills_dim.skills, 
    COUNT(job_postings_fact.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY 
    skills_dim.skill_id
HAVING 
    COUNT(job_postings_fact.job_id) >= 10
ORDER BY 
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
