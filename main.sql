create database E_commerce;
use E_commerce;
set foreign_key_checks = 0;
create table customers(
customer_id int primary key auto_increment,
frist_name varchar (100)not null,
last_name varchar (100)not null,
email varchar (100) unique not null,
city varchar (100),
created_at timestamp default current_timestamp
);
insert into customers (frist_name, last_name, email, city, created_at) values
('Hamza', 'ahmed', 'hamza@gmail.com', 'karachi', default),
('Ayesha', 'noor', 'ayesha@gmail.com', 'islamabad', default),
('Bilal', 'shah', 'bilal@gmail.com', 'lahore', default),
('Sana', 'iqbal', 'sana@gmail.com', 'multan', default),
('Usman', 'raza', 'usman@gmail.com', 'peshawar', default),
('Hina', 'tariq', 'hina@gmail.com', 'karachi', default),
('Fahad', 'ali', 'fahad@gmail.com', 'quetta', default),
('Zara', 'khan', 'zara@gmail.com', 'islamabad', default),
('Omar', 'sheikh', 'omar@gmail.com', 'faisalabad', default),
('Mariam', 'butt', 'mariam@gmail.com', 'lahore', default);

create table categories(
category_id int auto_increment primary key,
category_name varchar (200) not null
);
insert into categories (category_name) values
('Books'),
('Sports');

create table products(
product_id int auto_increment primary key,
product_name varchar(100) not null,
category_id int,
price decimal (10, 2) not null,
stock_quantity int default 0,
foreign key (category_id) references categories (category_id) on delete set null
);

insert into products (product_name, category_id, price, stock_quantity) values
('Bluetooth speaker', 1, 1500.00, 30),
('Running shoes', 5, 3200.00, 15),
('Denim jeans', 2, 2200.00, 20),
('Microwave oven', 3, 18000.00, 4),
('Python programming book', 4, 1800.00, 40),
('Football', 5, 1400.00, 12),
('Winter jacket', 2, 4500.00, 7),
('Air fryer', 3, 9500.00, 9),
('USB keyboard', 1, 2100.00, 18),
('Notebook set', 4, 600.00, 60);

create table orders (
order_id int auto_increment primary key,
customer_id int,
order_date date not null,
total_amount decimal (10, 2) default 0.00,
foreign key (customer_id) references customers (customer_id) on delete cascade
);
insert into orders (order_id, customer_id, order_date, total_amount) values
(1, 1, '2026-09-01', 3000.00),
(2, 2, '2026-09-03', 2400.00),
(3, 3, '2026-09-05', 3500.00),
(4, 4, '2026-09-08', 4400.00),
(5, 5, '2026-09-10', 3900.00),
(6, 6, '2026-09-12', 18000.00),
(7, 7, '2026-09-15', 5800.00),
(8, 8, '2026-09-18', 6300.00),
(9, 9, '2026-09-21', 9500.00),
(10, 10, '2026-09-25', 4500.00),
(11, 11, '2026-10-02', 4200.00),
(12, 12, '2026-10-06', 5300.00),
(13, 1, '2026-10-08', 5300.00);


create table order_items(
item_id int auto_increment primary key,
order_id int,
product_id int,
quantity int not null,
unit_price decimal(10, 2) not null,
foreign key (order_id) references orders (order_id) on delete cascade,
foreign key (product_id) references products (product_id) on delete cascade
);

insert into order_items (order_id, product_id, quantity, unit_price) values
(4, 5, 1, 3200.00),
(4, 13, 2, 600.00),
(5, 8, 1, 1800.00),
(5, 12, 1, 2100.00),
(6, 7, 1, 18000.00),
(7, 6, 2, 2200.00),
(7, 9, 1, 1400.00),
(8, 10, 1, 4500.00),
(8, 13, 3, 600.00),
(9, 11, 1, 9500.00),
(10, 4, 2, 1500.00),
(10, 1, 1, 1500.00),
(11, 2, 2, 1200.00),
(11, 8, 1, 1800.00),
(12, 3, 1, 2500.00),
(12, 9, 2, 1400.00),
(13, 12, 1, 2100.00),
(13, 5, 1, 3200.00);

select * from customers;
select * from categories;
select * from products;
select * from orders;
select * from order_items;

select p.product_name,
        sum(oi.quantity) as total_quantity_sold
        from products p inner join order_items oi on p.product_id = oi.product_id 
        group by p.product_name order by total_quantity_sold 
        desc limit 5;
select c.city,
c.frist_name,
        max(o.total_amount)
        from customers c inner join orders o on c.customer_id = o.customer_id group by c.city,c.frist_name ;
select c.email,
		c.city,
        sum(o.total_amount) as total_revenue
		from customers c inner join orders o on c.customer_id = o.order_id group by c.city,c.email order by total_amount desc;
select product_id,product_name, stock_quantity from products where stock_quantity < 10;
select p.product_name,
		o.order_id,
        o.customer_id,
        o.total_amount
        from orders o left join  products p on p.product_id = o.order_id where order_id is null;
select c.customer_id,
		c.frist_name,
        c.email,
        count(o.order_id) as total_orders,
        o.total_amount
        from customers c left join orders o on c.customer_id = o.order_id group by c.customer_id,c.frist_name;