# SQL-Datawarehouse-Project

This project showcases a comprehensive data warehousing and analytics solution, spanning the development of a data warehouse to the generation of actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

----

## 📖 Project Overview

This project involves:

1. Data Architecture: Designing a Modern Data Warehouse Using Medallion Architecture; Bronze, Silver, and Gold layers.
2. ETL Pipelines: Extracting, transforming, and loading data from source systems into the warehouse.
3. Data Modelling: Developing fact and dimension tables optimised for analytical queries.
4. Analytics & Reporting: Creating SQL-based reports and dashboards for actionable insights.

🎯 This repository showcases expertise in:

- SQL Development
- Data Architecturing
- Data Engineering
- ETL Pipeline Developer
- Data Modelling
- Data Analytics


---

## 🏗️ Data Architecture
The data architecture for this project follows Medallion Architecture Bronze, Silver, and Gold layers:

<img width="1341" height="690" alt="image" src="https://github.com/user-attachments/assets/3f69f175-d669-4350-90b8-3ce24c717ee0" />


1. Bronze Layer: Stores raw data as-is from the source systems. Data is ingested from CSV Files into the SQL Server Database.
2. Silver Layer: This layer includes data cleansing, standardisation, and normalisation processes to prepare data for analysis.
3. Gold Layer: Houses business-ready data modelled into a star schema required for reporting and analytics.

------




## 📂 Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project
```
---

## 🌟 About Me
Hi there! I'm Sachintha. I’m a BI professional and I build data-driven solutions that empower leaders to make better, faster decisions. Explore my work here to see how I turn data into actionable insights.

Let's stay in touch! Feel free to connect with me on the following platforms:

<div id="badges">
  <a href="https://www.linkedin.com/in/sachintha-kahawewithana/">
    <img src="https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Badge"/>
  </a> </div><div id="badges">
  <a href="https://medium.com/@BI.Diaries">
    <img width="99" height="28" alt="image" src="https://github.com/user-attachments/assets/887aad7f-412c-45dc-8557-646cc9473f2a" />
  </a>
</div>
