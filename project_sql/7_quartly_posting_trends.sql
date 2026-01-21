/*
Analysis: Quarterly Data Analyst Job Postings (2023)
Scope: Dallas–Fort Worth Metroplex

Methodology:
- Filter job postings to Data Analyst roles in selected DFW cities with valid salary data.
- Restrict postings to the year 2023.
- Aggregate postings by quarter using EXTRACT(QUARTER) and format as 'Q1', 'Q2', etc.
- Count the number of postings per quarter to identify trends over the year.

Objective:
Track the quarterly distribution of Data Analyst job postings in DFW during 2023
to highlight hiring trends and seasonal patterns in the job market.
*/

WITH dallas_top15 AS (
    SELECT * FROM (VALUES
        ('Dallas, TX'), ('Fort Worth, TX'), ('Arlington, TX'), ('Plano, TX'),
        ('Irving, TX'), ('Garland, TX'), ('Frisco, TX'), ('McKinney, TX'),
        ('Denton, TX'), ('Grand Prairie, TX'), ('Richardson, TX'), ('Carrollton, TX'),
        ('Lewisville, TX'), ('Allen, TX'), ('Grapevine, TX')
    ) AS t(city)
)

SELECT
    'Q' || EXTRACT(QUARTER FROM jp.job_posted_date)::int AS quarters_of_2023,
    COUNT(*) AS num_postings
FROM job_postings_fact jp
INNER JOIN dallas_top15 d15 ON jp.job_location = d15.city
WHERE jp.job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
  AND jp.job_posted_date >= '2023-01-01'
  AND jp.job_posted_date < '2024-01-01'
GROUP BY EXTRACT(YEAR FROM jp.job_posted_date), EXTRACT(QUARTER FROM jp.job_posted_date)
ORDER BY EXTRACT(YEAR FROM jp.job_posted_date), EXTRACT(QUARTER FROM jp.job_posted_date);
