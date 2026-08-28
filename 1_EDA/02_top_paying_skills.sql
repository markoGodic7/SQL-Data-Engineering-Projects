/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing 
    how common those skills are, providing a more complete picture for skill development priorities
*/

SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.*) AS skills_count
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
    median_salary DESC
LIMIT 25;

/*

The salary data shows that several specialized technologies can significantly increase earning potential for Data Engineers.

**Key insights:**

* Rust has the highest median salary at approximately **$210K**, although it appears in only **232 job postings**, indicating relatively limited demand.
* **Terraform and Golang** both offer a median salary of around **$184K**. Terraform has particularly strong demand with **3,248 postings**, while Golang appears in **912 postings**.
* Several other skills combine strong compensation with meaningful market demand, including:

  * **Spring:** $175.5K median salary across 364 postings
  * **Neo4j:** $170K across 277 postings
  * **GDPR:** $169.6K across 582 postings
  * **GraphQL:** $167.5K across 445 postings
  * **Kubernetes:** $150.5K across 4,202 postings
  * **Airflow:** $150K across 9,996 postings
* **Bitbucket, Ruby, Redis, Ansible, and Jupyter** also rank among the 25 highest-paying skills, with each appearing in hundreds of job listings.
* Unlike some salary rankings that are driven by a very small number of job postings, many of these skills demonstrate both strong compensation and substantial market demand.

**Takeaway:**
The highest salary does not necessarily mean the strongest career opportunity. Rust leads in compensation but has relatively low demand, while technologies such as **Terraform, Golang, Kubernetes, and Airflow** offer a more attractive combination of salary and job availability. For someone pursuing Data Engineering, focusing on widely used tools such as **Airflow and Kubernetes**, alongside complementary technologies like Terraform and Golang, can provide a strong balance between earning potential and employability.

┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ skills_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ golang     │      184000.0 │          912 │
│ terraform  │      184000.0 │         3248 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169616.0 │          582 │
│ zoom       │      168438.0 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ bitbucket  │      155000.0 │          478 │
│ django     │      155000.0 │          265 │
│ crystal    │      154224.0 │          129 │
│ atlassian  │      151500.0 │          249 │
│ c          │      151500.0 │          444 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ node       │      150000.0 │          179 │
│ ruby       │      150000.0 │          736 │
│ airflow    │      150000.0 │         9996 │
│ css        │      150000.0 │          262 │
│ redis      │      149000.0 │          605 │
│ ansible    │      148798.0 │          475 │
│ vmware     │      148798.0 │          136 │
│ jupyter    │      147500.0 │          400 │
└────────────┴───────────────┴──────────────┘
  25 rows                         3 columns

*/





