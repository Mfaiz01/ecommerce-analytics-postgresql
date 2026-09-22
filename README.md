# E-Commerce Sales & Inventory Analytics — PostgreSQL

A practical PostgreSQL database project designed to demonstrate relational database design, SQL querying, analytics, constraints, views, indexes, and stored functions.

## Project Overview

The database models a small e-commerce platform with:

- Customers
- Product categories
- Products
- Inventory
- Orders
- Order items
- Payments

## Database Design

```text
categories
    │
    └──< products
             │
             └──< inventory

customers
    │
    └──< orders
             │
             ├──< order_items >── products
             │
             └── payments
```

See [`docs/er-diagram.md`](docs/er-diagram.md) for the detailed ER design.

## SQL Files

| File | Purpose |
|---|---|
| `01_schema.sql` | Creates tables, keys, relationships and constraints |
| `02_seed_data.sql` | Inserts realistic sample data |
| `03_queries.sql` | SELECT, JOIN, aggregation, subquery and window-function examples |
| `04_views.sql` | Reusable analytical views |
| `05_indexes.sql` | Performance-oriented indexes |
| `06_functions.sql` | PostgreSQL stored functions |

## Main Concepts Demonstrated

- Primary keys and foreign keys
- `NOT NULL`, `UNIQUE`, `CHECK`, and `DEFAULT`
- One-to-many relationships
- `INNER JOIN` and `LEFT JOIN`
- `GROUP BY`, `HAVING`, and `COUNT`
- Subqueries and CTEs
- Window functions
- Views
- Indexes
- PL/pgSQL functions
- Sales and inventory analytics

## Execution Order

Run the files in this order from a PostgreSQL database such as `ecommerce_analytics`:

```text
01_schema.sql
02_seed_data.sql
03_queries.sql
04_views.sql
05_indexes.sql
06_functions.sql
```

## Example Business Questions

The project can answer questions such as:

- What is the total revenue?
- Which products generate the most revenue?
- Which customers spend the most?
- How many orders are completed or cancelled?
- Which categories perform best?
- Which products have low inventory?
- What is the average order value?
- What are monthly sales trends?

## PostgreSQL Version

Designed for PostgreSQL 17.

## Author

Mohammed Faiz
