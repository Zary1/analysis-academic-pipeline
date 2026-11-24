Student Performance Data Engineering Pipeline

End-to-end Data Engineering pipeline for student performance analytics using Python, SQL Server, dbt, Apache Airflow, Docker and Power BI.

Architecture
CSV Dataset
     ↓
Python (Extraction)
     ↓
Python (Ingestion)
     ↓
SQL Server (Raw Layer)
     ↓
dbt Staging
     ↓
dbt Intermediate
     ↓
Dimensions & Facts
     ↓
Data Marts
     ↓
Power BI

      ↑
Apache Airflow 


Technologies:
Python
Pandas
SQLAlchemy
pyodbc
SQL Server
dbt
Apache Airflow
Docker
Power BI
Git & GitHub


Components:
Extraction
Python scripts responsible for reading the CSV dataset.

Ingestion
Loading data into the SQL Server Raw schema.

Storage
SQL Server used as the central data storage platform.

Transformation
dbt models for:
Staging
Intermediate
Dimensions
Facts
Marts
Orchestration
Apache Airflow DAG responsible for automating extraction, ingestion and transformation processes.

Visualization
Power BI dashboards built on top of analytical marts.

Data Models
Staging
 -stg_student_por
Intermediate
 -int_student_performance
Dimensions
 -dim_school
Facts
 -fact_student_performance
Marts
 -mart_student_performance_summary
 
Pipeline Flow
Extract data from CSV.
Load data into SQL Server Raw schema.
Execute dbt transformations.
Build dimensions, facts and marts.
Orchestrate the pipeline with Airflow.
Consume curated datasets in Power BI.