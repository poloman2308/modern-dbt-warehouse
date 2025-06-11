# 🧠 Modern dbt Data Warehouse

[![DBT](https://img.shields.io/badge/dbt-1.9+-orange)](https://www.getdbt.com/)
[![PostgreSQL](https://img.shields.io/badge/database-PostgreSQL-blue)](https://www.postgresql.org/)
[![Docker](https://img.shields.io/badge/Container-Docker-blue)](https://www.docker.com/)
[![MIT License](https://img.shields.io/badge/license-MIT-yellow.svg)](LICENSE)

---

## 📌 Overview

This project implements a **modular, production-ready dbt data warehouse** for an e-commerce analytics domain using PostgreSQL and Docker. It showcases best practices in **data modeling, testing, documentation, macros**, and **snapshots**.

You’ll find a complete architecture designed to reflect modern analytics workflows, ideal for portfolio presentation or real-world deployment.

---

## 🧱 Architecture

```mermaid
flowchart TD
    RawData([Raw CSVs])
    RawData -->|Load via DBeaver| RawTables[PostgreSQL raw schema]
    RawTables --> StagingModels
    StagingModels --> IntermediateModels
    IntermediateModels --> Marts
    RawTables --> Snapshots
    Marts --> dbtDocs[📚 dbt Docs]

    subgraph dbt Pipeline
        StagingModels[🧹 Staging]
        IntermediateModels[🔁 Business Logic]
        Marts[📊 Analytics-Ready Marts]
        Snapshots[🕵️ SCD Snapshots]
        Macros[🔧 Macros & Reusables]
    end
```

---

## ✨ Key Features
* Source Configuration for raw Postgres tables

* Staging Models for cleaned, typed, and normalized data

* Intermediate Models for reusable business logic

* Marts for customer LTV and sales KPIs

* Data Quality Tests with unique, not_null, and assertions

* Snapshots using dbt’s SCD Type 2 tracking

* Macros for reusable logic: currency conversion, safe division, formatting

* Auto-generated dbt Docs and model DAG

* PostgreSQL + Docker setup

---

## 📁 Project Structure

```bash
analytics_warehouse/
├── models/
│   ├── src/                # dbt sources
│   ├── staging/            # cleaned staging layer
│   ├── intermediate/       # joins and business rules
│   └── marts/              # final analytics tables
├── snapshots/              # historical tracking
├── macros/                 # reusable Jinja macros
├── seeds/                  # static reference data (if used)
├── dbt_project.yml         # dbt config
├── profiles.yml            # dbt connection (outside repo)
```

---

## 🚀 How to Run Locally
Requires: Docker, dbt-core (pip install dbt-postgres)
1. Spin up PostgreSQL
```bash
docker run --name modern_pg -e POSTGRES_USER=modern_dbt -e POSTGRES_PASSWORD=modern -e POSTGRES_DB=analytics -p 5432:5432 -d postgres
```
2. Load Raw CSVs into schema raw using DBeaver
3. Run dbt models
```bash
dbt run
dbt test
```
4. Generate & serve docs
```bash
dbt docs generate
dbt docs serve
```

---

## 🧪 Data Quality & Snapshots
* Snapshots: snapshots/customers_snapshot.sql tracks email history

* Tests: Defined in schema.yml for each model

* Macros:

  * convert_usd()

  * safe_divide()

  * format_currency()

  * is_high_value_order()

---

## 🧑‍💻 Author
**Derek Acevedo**
Data Engineer | SQL & dbt Enthusiast

🔗 [LinkedIn](https://www.linkedin.com/in/derekacevedo86)
🔗 [GitHub](https://www.github.com/poloman2308)

---
