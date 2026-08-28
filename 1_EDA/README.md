# 🔍 Exploratory Data Analysis with SQL: Job Market Analytics

![EDA Project Overview](https://raw.githubusercontent.com/lukebarousse/SQL_Data_Engineering_Course/main/Resources/images/1_1_Project1_EDA.png)

A SQL-based exploratory data analysis project focused on the data engineering job market. Using real-world job posting data, this project demonstrates my ability to **develop analytical SQL queries, work with relational data models, and transform business questions into meaningful, data-driven insights**.

---

## 🧾 Executive Summary

* ✅ **Project scope:** Developed **3 analytical SQL queries** to investigate key aspects of the data engineering job market
* ✅ **Data modeling:** Combined data from fact, dimension, and bridge tables using **multi-table joins**
* ✅ **Analytics:** Used aggregations, filtering, grouping, and sorting to evaluate skill demand, compensation, and overall skill value
* ✅ **Key findings:** Identified trends around SQL/Python demand, cloud technologies, infrastructure tools, and salary levels

For a quick overview of the analysis, check out these three queries:

1. [`01_top_demanded_skills.sql`](./01_top_demanded_skills.sql) – explores the most frequently requested skills
2. [`02_top_paying_skills.sql`](./02_top_paying_skills.sql) – identifies skills associated with the highest salaries
3. [`03_optimal_skills.sql`](./03_optimal_skills.sql) – combines demand and salary to determine the most valuable skills

---

## 🧩 Problem & Context

The data engineering job market raises several important questions for both job seekers and market analysts:

* 🎯 **Demand:** *Which technical skills are requested most frequently by employers?*
* 💰 **Compensation:** *Which skills are associated with the highest salaries?*
* ⚖️ **Skill value:** *Which skills provide the best balance between market demand and earning potential?*

To answer these questions, this project works with a **data warehouse based on a star schema**.

![Data Warehouse Schema](https://raw.githubusercontent.com/lukebarousse/SQL_Data_Engineering_Course/main/Resources/images/1_2_Data_Warehouse.png)

The warehouse contains the following core tables:

* **Fact Table:** `job_postings_fact` – stores individual job posting information, including job titles, locations, salaries, dates, and other attributes
* **Dimension Tables:**

  * `company_dim` – contains information about companies associated with job postings
  * `skills_dim` – provides the available skills, including skill names and categories
* **Bridge Table:** `skills_job_dim` – connects job postings with their associated skills and handles the many-to-many relationship between jobs and skills

By combining these tables, the analysis explores which technologies are most requested, which skills are linked to higher compensation, and which skills offer the strongest overall career value.

---

## 🧰 Tech Stack

* 🐤 **Query Engine:** DuckDB for efficient analytical and OLAP-style SQL processing
* 🧮 **Language:** SQL using ANSI-style syntax and analytical functions
* 📊 **Data Model:** Star schema consisting of fact, dimension, and bridge tables
* 🛠️ **Development Environment:** VS Code for SQL development and Terminal for running DuckDB CLI commands
* 🤖 **AI Code Review:** CodeRabbit for AI-assisted code reviews, feedback, and quality checks
* 📦 **Version Control:** Git and GitHub for managing and versioning the SQL scripts


---

## 📂 Repository Structure

```text
1_EDA/
├── 01_top_demanded_skills.sql    # Analyzes the most in-demand skills
├── 02_top_paying_skills.sql      # Identifies the highest-paying skills
├── 03_optimal_skills.sql         # Combines demand and salary metrics
└── README.md                     # Project documentation
```

---

## 🏗️ Analysis Overview

### Query Structure

The project is divided into three analytical queries:

1. **[Top Demanded Skills](./01_top_demanded_skills.sql)** – Finds the 10 most frequently requested skills in remote data engineering job postings

2. **[Top Paying Skills](./02_top_paying_skills.sql)** – Examines the 25 highest-paying skills while also considering their market demand

3. **[Optimal Skills](./03_optimal_skills.sql)** – Creates an overall skill score by combining median salary with a natural logarithm transformation of job demand to highlight skills with strong career potential

### Key Insights

* 🧠 **Programming & querying:** SQL and Python are the dominant skills, each appearing in approximately 29,000 job postings
* ☁️ **Cloud technologies:** AWS and Azure remain important components of the modern data engineering ecosystem
* 🧱 **Infrastructure & DevOps:** Technologies such as Kubernetes, Docker, and Terraform are associated with higher compensation levels
* 🔥 **Big data:** Apache Spark demonstrates both substantial market demand and competitive salary potential

---

## 💻 SQL Skills Demonstrated

### Query Design & Optimization

* **Multi-table Joins:** Used `INNER JOIN` operations to combine `job_postings_fact`, `skills_job_dim`, and `skills_dim`
* **Aggregations:** Applied functions such as `COUNT()`, `MEDIAN()`, and `ROUND()` to generate analytical metrics
* **Conditional Filtering:** Used `WHERE` clauses with multiple conditions, including `job_title_short`, `job_work_from_home`, and `salary_year_avg IS NOT NULL`
* **Top-N Analysis:** Used `ORDER BY DESC` together with `LIMIT` to identify the highest-ranked skills

### Data Analysis Techniques

* **Grouping:** Applied `GROUP BY` to analyze job market metrics at the individual skill level
* **Mathematical Transformations:** Used `LN()` to apply a natural logarithm transformation to job demand
* **Derived Metrics:** Calculated an optimal skill score combining transformed demand with median salary
* **Aggregated Filtering:** Used `HAVING` to restrict results to skills with at least 100 job postings
* **NULL Handling:** Excluded incomplete salary records using `salary_year_avg IS NOT NULL`
