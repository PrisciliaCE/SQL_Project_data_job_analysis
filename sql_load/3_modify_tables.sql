COPY company_dim
FROM '/mnt/c/Users/eypri/OneDrive/Desktop/DataBaddie/SQL_Project_data_job_analysis/csv_files/company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM '/mnt/c/Users/eypri/OneDrive/Desktop/DataBaddie/SQL_Project_data_job_analysis/csv_files/skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM '/mnt/c/Users/eypri/OneDrive/Desktop/DataBaddie/SQL_Project_data_job_analysis/csv_files/job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM '/mnt/c/Users/eypri/OneDrive/Desktop/DataBaddie/SQL_Project_data_job_analysis/csv_files/skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
