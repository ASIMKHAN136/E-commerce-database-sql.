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
- `products.category_id` → `categories.category_id` (if a category is deleted, the product's category becomes NULL)
- `orders.customer_id` → `customers.customer_id` (deleting a customer also deletes their orders)
- `order_items.order_id` → `orders.order_id` (deleting an order also deletes its items)
- `order_items.product_id` → `products.product_id` (deleting a product also deletes its order items)

## Status
Tables are created. Sample data and queries are coming in the next commits.