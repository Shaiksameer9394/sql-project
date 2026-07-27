# E-Commerce Order Management (SQL Project)

A relational database project modeling a small e-commerce system — customers, products, orders, and order items — with queries for filtering, joins, aggregation, subqueries, and window functions.

## Files
- `schema.sql` — table definitions (customers, products, orders, order_items) with primary/foreign keys
- `sample_data.sql` — sample rows to populate the tables
- `queries.sql` — practice queries: filters, joins, aggregations, subquery, window function
- `README.md` — this file

## How to run
1. Run `schema.sql` to create the database and tables
2. Run `sample_data.sql` to insert sample records
3. Run any query from `queries.sql` to see results

Works in MySQL. For SQLite/PostgreSQL, remove `AUTO_INCREMENT` and `CREATE DATABASE`/`USE` lines and adjust auto-increment syntax accordingly.

## Concepts covered
- Relational schema design & normalization
- Primary keys / foreign keys
- `JOIN`s across multiple tables
- Aggregate functions (`SUM`, `GROUP BY`)
- Subqueries
- Window functions (`RANK()`)

## Example insight
Query 4 (total revenue per customer) and Query 7 (ranking customers by spend) simulate the kind of reporting used in real analytics dashboards.
