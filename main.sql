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

create table categories(
category_id int auto_increment primary key,
category_name varchar (200) not null
);

create table products(
product_id int auto_increment primary key,
product_name varchar(100) not null,
category_id int,
price decimal (10, 2) not null,
stock_quantity int default 0,
foreign key (category_id) references categories (category_id) on delete set null
);

create table orders (
order_id int auto_increment primary key,
customer_id int,
order_date date not null,
total_amount decimal (10, 2) default 0.00,
foreign key (customer_id) references customers (customer_id) on delete cascade
);

create table order_items(
item_id int auto_increment primary key,
order_id int,
product_id int,
quantity int not null,
unit_price decimal(10, 2) not null,
foreign key (order_id) references orders (order_id) on delete cascade,
foreign key (product_id) references products (product_id) on delete cascade
);