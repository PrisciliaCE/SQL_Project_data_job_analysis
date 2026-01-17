WITH dallas_top15 AS (
    SELECT * FROM (VALUES
        ('Dallas, TX'), ('Fort Worth, TX'), ('Arlington, TX'), ('Plano, TX'),
        ('Irving, TX'), ('Garland, TX'), ('Frisco, TX'), ('McKinney, TX'),
        ('Denton, TX'), ('Grand Prairie, TX'), ('Richardson, TX'), ('Carrollton, TX'),
        ('Lewisville, TX'), ('Allen, TX'), ('Grapevine, TX')
    ) AS t(city)
),
dfw_data_analyst AS (
    SELECT
        jp.job_id,
        jp.job_title,
        salary_year_avg,
        name AS company_name 
    FROM
        job_postings_fact jp
    LEFT JOIN company_dim ON jp.company_id = company_dim.company_id
    INNER JOIN dallas_top15 ON jp.job_location = dallas_top15.city
    WHERE
        jp.job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL
)


-- Top paying skills
SELECT 
    d.*,
    STRING_AGG(s.skills, ', ') AS required_skills
FROM 
    dfw_data_analyst d
INNER JOIN skills_job_dim ON d.job_id = skills_job_dim.job_id
INNER JOIN skills_dim AS s ON skills_job_dim.skill_id = s.skill_id
GROUP BY
    d.job_id,
    d.job_title,
    d.company_name,
    d.salary_year_avg
ORDER BY salary_year_avg DESC
LIMIT 10;