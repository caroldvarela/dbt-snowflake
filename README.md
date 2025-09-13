# 🚴‍♂️ Bike Store Data Pipeline

A comprehensive data engineering project that demonstrates modern data pipeline architecture using **Snowflake**, **dbt**, **Apache Airflow**, and **Power BI**. This project processes bike store sales data and creates a complete analytics-ready data warehouse.

[![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)](https://www.snowflake.com/)
[![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)](https://www.getdbt.com/)
[![Apache Airflow](https://img.shields.io/badge/Apache%20Airflow-017CEE?style=for-the-badge&logo=apacheairflow&logoColor=white)](https://airflow.apache.org/)
[![Astronomer](https://img.shields.io/badge/Astronomer-000000?style=for-the-badge&logo=astronomer&logoColor=white)](https://www.astronomer.io/)
[![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)

![image](https://github.com/caroldvarela/images/blob/main/dbt-snowflake.png)

## 📊 Project Overview

This project showcases a production-ready data pipeline that:

- **Transforms** data using dbt (data build tool)
- **Orchestrates** workflows with Apache Airflow
- **Visualizes** insights with Power BI

## 🎯 Dataset

**Source**: [Bike Store Relational Database](https://www.kaggle.com/datasets/dillonmyrick/bike-store-sample-database)

**Tables**:
- `brands` - Product brands
- `categories` - Product categories  
- `customers` - Customer information
- `order_items` - Order line items
- `orders` - Order headers
- `products` - Product catalog
- `staffs` - Staff information
- `stores` - Store locations
- `stocks` - Inventory levels

![image](https://github.com/caroldvarela/images/blob/main/bike-store.png)

## 🛠️ Tech Stack

- **Data Warehouse**: Snowflake
- **Transformation**: dbt (data build tool)
- **Orchestration**: Apache Airflow + Astronomer Cosmos
- **Visualization**: Power BI
- **Containerization**: Docker

## 🚀 Prerequisites

- [Snowflake account](https://signup.snowflake.com/)
- [Docker](https://www.docker.com/get-started)
- Python 3.8+ (for local development)
- [Astro CLI](https://www.astronomer.io/docs/astro/cli/)

## 📁 Project Structure

```
dbt-snowflake/
├── dbt_dag/                          # Airflow DAG configuration
│   ├── dags/
│   │   ├── dbt_dag.py               # Main Airflow DAG
│   │   └── dbt/
│   │       └── dbt_snowflake_pipeline/
│   │           ├── models/
│   │           │   ├── staging/     # Staging models (views)
│   │           │   └── marts/       # Mart models (tables)
│   │           ├── macros/           # Custom dbt macros
│   │           └── tests/            # Data quality tests
│   ├── Dockerfile                    # Airflow container config
│   └── requirements.txt             # Python dependencies
├── setup_snowflake.sql              # Snowflake environment setup
├── requirements.txt                 # Project dependencies
├── Dashboard.pdf                    # Power BI dashboard
└── README.md                        # Project documentation
```
The Airflow project was initialized with **Astronomer CLI** using `astro dev init`, which generated the base structure (`dbt_dag/`). On top of that foundation, the dbt project was integrated with Cosmos.

## 🔄 Data Flow

### 1. Raw Data Layer (`dbt_db.raw`)
- Serves as the **source layer** for all downstream transformations
- Contains original CSV data loaded into Snowflake
- Tables: `brands`, `categories`, `customers`, `orders`, etc.

### 2. Staging Layer (`dbt_db.dbt_schema.staging`)
- Cleaned and standardized data
- Materialized as views for performance
- Includes data type conversions and basic cleaning

### 3. Marts Layer (`dbt_db.dbt_schema.marts`)
- Business-ready dimensional models
- Materialized as tables for query performance
- Includes: `dim_customer`, `dim_product`, `fact_orders`, etc.

## 🚀 Astronomer Cosmos Integration

This project leverages **Astronomer Cosmos** to seamlessly integrate dbt with Apache Airflow:

### Key Benefits:
- **Automatic DAG Generation**: Cosmos automatically creates Airflow DAGs from your dbt project
- **Dependency Management**: Automatically handles dbt model dependencies in Airflow
- **Profile Management**: Simplified connection to Snowflake through Airflow
- **Error Handling**: Built-in retry logic and failure management

### How It Works:
1. **Cosmos** reads your `dbt_project.yml` and model files
2. **Generates** Airflow tasks for each dbt model
3. **Creates** dependencies based on dbt's lineage
4. **Manages** execution through Airflow's scheduler

The DAG (`dbt_dag`) you see in Airflow UI is automatically generated by Cosmos!

![image](https://github.com/caroldvarela/images/blob/main/AirflowDAG.png)

⏯️ **Watch the video to see how it looks**:

[![Watch the video](https://img.youtube.com/vi/17p86Y8h8j4/hqdefault.jpg)](https://youtu.be/17p86Y8h8j4)

## 📈 Key Features

### ✨ Data Quality
- Automated data quality tests using dbt
- Custom macros for business logic validation
- Data lineage tracking

### 🔄 Orchestration
- Automated pipeline runs
- Error handling and retry logic
- Dependency management between tasks

### 📊 Analytics Ready
- Star schema design for optimal query performance
- Pre-aggregated metrics and KPIs
- Power BI integration ready

## 📊 Power BI Integration

1. **Connect to Snowflake**:
   - Use Snowflake connector in Power BI
   - Connect to `dbt_db.dbt_schema.marts` schema
   - Import dimensional models

![image](https://github.com/caroldvarela/images/blob/main/dbt-snowflake-powerbi.png)

📊 You can see mine here:  [Dashboard](https://github.com/caroldvarela/dbt-snowflake/blob/develop/Dashboard.pdf) 

