create database ShoppingSalesAnalysis;

use ShoppingSalesAnalysis;

-- 고객 테이블
create table customers(
    id int PRIMARY key,
    name varchar(50),
    email varchar(50)
);

-- 주문 테이블
create table orders(
    id int PRIMARY key,
    customer_id int,
    order_date DATE,

    foreign key(customer_id) references customers(id)
);


-- 상품 테이블
create table products(
    id int PRIMARY KEY,
    name VARCHAR(50),
    price int,
    stock int
);

-- 주문 테이블
create table order_items(
    id int PRIMARY key,
    order_id int,
    product_id int,
     
    Foreign Key (order_id) REFERENCES orders(id),
    foreign key(product_id) references products(id)
);


