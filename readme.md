# E-Commerce Database (SQL Project)

A MySQL database for a small online store. It keeps track of customers, 
product categories, products, orders, and the items inside each order.

## Database: E_commerce

## Tables (5 total)

### 1. customers
- customer_id (PK)
- frist_name
- last_name
- email (unique)
- city
- created_at (filled automatically with the current time)

### 2. categories
- category_id (PK)
- category_name

### 3. products
- product_id (PK)
- product_name
- category_id (FK → categories)
- price
- stock_quantity (default 0)

### 4. orders
- order_id (PK)
- customer_id (FK → customers)
- order_date
- total_amount

### 5. order_items
- item_id (PK)
- order_id (FK → orders)
- product_id (FK → products)
- quantity
- unit_price

## Relationships
- products.category_id → categories.category_id (if a category is deleted, the product's category becomes NULL)
- orders.customer_id → customers.customer_id (deleting a customer also deletes their orders)
- order_items.order_id → orders.order_id (deleting an order also deletes its items)
- order_items.product_id → products.product_id (deleting a product also deletes its order items)

## Status
Tables are created. Sample data and queries are coming in the next commits.

## Sample Data

The database comes with about 67 rows of sample data across 5 tables:

| Table | Rows | What's in it |
|---|---|---|
| customers | 13 | Customers from 7 cities, including Peshawar, Lahore, Karachi, Islamabad, Multan, Quetta, and Faisalabad |
| categories | 5 | Electronics, Clothings, Home appliances, Books, Sports |
| products | 13 | Products like a wireless mouse, running shoes, air fryer, and books, with prices and stock levels |
| orders | 13 | Orders placed between September and October 2026 |
| order_items | 23 | The individual products inside each order, with quantity and unit price |

One customer has no orders on purpose, so the LEFT JOIN query has something to show.

Note: the script turns foreign key checks off at the top 
(set foreign_key_checks = 0;) so the sample data can be inserted freely.

## Files
- main.sql: table creation, sample data, and queries

## How to run
1. Open MySQL (Workbench, CLI, or phpMyAdmin)
2. Run main.sql from top to bottom