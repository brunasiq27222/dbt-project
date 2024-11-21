# DBT Project

## Project Overview
This project uses DBT (Data Build Tool) to transform and model data in a PostgreSQL database. The goal is to demonstrate the process of extracting, transforming, and loading (ETL) data, organized into the Source, Staging, and Mart layers, focusing on strategic data analysis.

## Project Structure
The project is structured as follows:

### Objectives
- Ingest data from CSV files into a PostgreSQL database.
- Transform data using DBT.

### Data Files
- `employee.csv`
- `order_credit_item.csv`
- `organization.csv`
- `wallet.csv`

## 1. Source Layer
In this layer, we set up the mapping of raw tables from the PostgreSQL database.

The `schema.yml` file is correctly configured for the tables and SQL models.
The original tables are referenced using the function `{{ source('source_name', 'table_name') }}`, which directly connects to the tables in the PostgreSQL database.


## 2. Staging Layer
The Staging layer is responsible for intermediate transformations. Here, we perform actions such as:

- Data cleaning, such as string standardization and removal of duplicates.
- Creation of calculated columns to add value to the data.
- Organizing raw data into more structured tables to facilitate subsequent analyses.

## 3. Mart Layer
In the Mart layer, the data is consolidated and prepared for strategic analysis.

Examples of data aggregation include consolidating revenue by period and category, allowing for detailed financial analysis. These tables serve as the basis for reports and dashboards that support strategic decision-making.

## Project Workflow
The project structure follows this flow:

- Source: Mapping of raw data directly extracted from the PostgreSQL database.
- Staging: Intermediate transformations to prepare the data.
- Mart: Final data modeling for strategic and performance analysis.

# Contact Information
For more information or questions about the project, please contact Bruna Siqueira at https://www.linkedin.com/in/bruna-siqueira-05814a182/
