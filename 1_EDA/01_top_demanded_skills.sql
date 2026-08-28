/*

    Question: What are the most in-demand skills for data engineers?
    - Identify the top 10 in-demand skills for data engineers
    - Focus on remote job postings
    - Why? Retrieves the top 10 skills with the highest demand in the remote job market,
       providing insights into the most valuable skills for data engineers seeking remote work


*/

SELECT
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
GROUP BY sd.skills 
ORDER BY demand_count DESC
LIMIT 10;


/*

SQL and Python clearly dominate the data engineering job market, with roughly 29,000 job listings mentioning each skill. This puts them well ahead of the other technologies in demand.

Cloud technologies are also highly sought after. AWS appears in around 18,000 postings, while Azure is mentioned in approximately 14,000. Apache Spark ranks among the top five, with close to 13,000 listings, emphasizing the continued importance of large-scale data processing.

**Key takeaways:**

* SQL and Python are still the core skills expected from data engineers.
* AWS and Azure demonstrate the strong role of cloud technologies in modern data engineering.
* Apache Spark remains an important tool for processing large datasets.
* Technologies such as Airflow, Snowflake, and Databricks are becoming increasingly popular for building and managing data pipelines.
* Java and Google Cloud Platform (GCP) also rank among the ten most frequently requested skills.

┌────────────┬──────────────┐ 
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
  10 rows         2 columns

*/