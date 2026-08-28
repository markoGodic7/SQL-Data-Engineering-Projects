/*
Question: What are the most optimal skills for data engineers—balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
- Why?
    - This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately instead of letting rare, outlier skills distort the results.
    - The natural log transformation ensures that both high-salary and widely in-demand skills surface as the most practical and valuable to learn for data engineering careers.
*/

SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.*) AS demand_count,
    ROUND(LN(COUNT(jpf.*)), 1) AS ln_demand_count,
    ROUND((MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*)))/1000000 , 2) AS optimal_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
    sd.skills
HAVING
    COUNT(jpf.*) >= 100
ORDER BY 
    optimal_score DESC
LIMIT 25;


/*

The most valuable skills for Data Engineers are those that combine strong job-market demand with competitive salaries. Looking at both factors together highlights several technologies that offer particularly good career potential.

**Top skills by overall value:**

* **Terraform** ranks first, with a median salary of approximately **$184K** and 193 job postings, giving it the strongest overall balance between compensation and demand.
* **Python and SQL** remain essential, with more than **1,100 postings each** and median salaries of approximately **$135K** and **$130K**.
* **AWS, Spark, and Airflow** are also strong choices. Their median salaries range from **$137K to $150K**, while each has hundreds of relevant job postings.
* **Kafka** combines a strong median salary of **$145K** with solid demand, appearing in 292 postings.
* **Snowflake, Azure, and Databricks** are well-positioned as modern data platforms, with roughly 250–475 postings and median salaries between **$128K and $137K**.

**DevOps and engineering tools:**

* **Airflow and Kubernetes** stand out with median salaries around **$150K**, while Docker offers approximately **$135K**.
* **Git and GitHub** remain broadly useful across data engineering roles and offer competitive compensation, with Git reaching a $140K median salary.

**Programming languages:**

* **Java and Scala** continue to be valuable for data engineering, with median salaries of approximately **$135K and $137K**, respectively.
* **Go** is another attractive option, offering around **$140K** median compensation across 113 postings.

**Databases and cloud technologies:**

* Technologies such as **Redshift, GCP, Hadoop, NoSQL, and MongoDB** can further strengthen a Data Engineering skill set, with median salaries generally falling between **$130K and $136K**.
* **R, PySpark, and BigQuery** also provide competitive compensation while meeting the required demand threshold.

**Summary:**
The strongest skills are not necessarily those with the highest salary or the largest number of job postings individually. Instead, the best opportunities tend to come from skills that provide a good balance of both. **Python, SQL, AWS, Spark, Airflow, and Terraform** stand out as particularly strategic choices, offering strong current demand while also supporting long-term growth in Data Engineering.


┌────────────┬───────────────┬──────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ demand_count │ ln_demand_count │ optimal_score │
│  varchar   │    double     │    int64     │     double      │    double     │
├────────────┼───────────────┼──────────────┼─────────────────┼───────────────┤
│ terraform  │      184000.0 │          193 │             5.3 │          0.97 │
│ python     │      135000.0 │         1133 │             7.0 │          0.95 │
│ sql        │      130000.0 │         1128 │             7.0 │          0.91 │
│ aws        │      137320.0 │          783 │             6.7 │          0.91 │
│ airflow    │      150000.0 │          386 │             6.0 │          0.89 │
│ spark      │      140000.0 │          503 │             6.2 │          0.87 │
│ snowflake  │      135500.0 │          438 │             6.1 │          0.82 │
│ kafka      │      145000.0 │          292 │             5.7 │          0.82 │
│ azure      │      128000.0 │          475 │             6.2 │          0.79 │
│ java       │      135000.0 │          303 │             5.7 │          0.77 │
│ scala      │      137290.0 │          247 │             5.5 │          0.76 │
│ kubernetes │      150500.0 │          147 │             5.0 │          0.75 │
│ git        │      140000.0 │          208 │             5.3 │          0.75 │
│ databricks │      132750.0 │          266 │             5.6 │          0.74 │
│ redshift   │      130000.0 │          274 │             5.6 │          0.73 │
│ gcp        │      136000.0 │          196 │             5.3 │          0.72 │
│ hadoop     │      135000.0 │          198 │             5.3 │          0.71 │
│ nosql      │      134415.0 │          193 │             5.3 │          0.71 │
│ pyspark    │      140000.0 │          152 │             5.0 │           0.7 │
│ mongodb    │      135750.0 │          136 │             4.9 │          0.67 │
│ docker     │      135000.0 │          144 │             5.0 │          0.67 │
│ r          │      134775.0 │          133 │             4.9 │          0.66 │
│ go         │      140000.0 │          113 │             4.7 │          0.66 │
│ github     │      135000.0 │          127 │             4.8 │          0.65 │
│ bigquery   │      135000.0 │          123 │             4.8 │          0.65 │
└────────────┴───────────────┴──────────────┴─────────────────┴───────────────┘
  25 rows                                                           5 columns

*/