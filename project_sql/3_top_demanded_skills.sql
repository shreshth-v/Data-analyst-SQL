-- This SQL query retrieves the top 10 most demanded skills for the job title 'Data Analyst' from a job postings database. It joins three tables: `job_postings_fact`, `skills_job_dim`, and `skills_dim` to count how many times each skill is associated with job postings for 'Data Analyst'. The results are grouped by skill and ordered by the demand count in descending order, limiting the output to the top 10 skills.
-- (SKILLS WITH MOST JOB POSTINGS)

SELECT 
    skills_dim.skill_id,
    skills_dim.skills, 
    COUNT(job_postings_fact.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY 
    skills_dim.skill_id
ORDER BY 
    demand_count DESC
LIMIT 10;