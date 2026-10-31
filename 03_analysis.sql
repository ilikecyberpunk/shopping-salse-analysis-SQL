-- 1. 전체 매출 조회

use shoppingsalesanalysis;

SELECT sum(o.quantity * p.price) as total_sales 
FROM order_items o 
inner JOIN products p ON o.product_id = p.id;

-- 2. 고객별 총 구매액 조회
select c.name , sum(p.price * oo.quantity) as total_spend
from customers c 
inner join orders o on c.id = o.customer_id 
inner join order_items oo on o.id = oo.order_id 
inner join products p ON p.id = oo.product_id
GROUP BY c.name;

--상품별 판매량 분석
-- 상품, 판매 수량, 수익
select p.name, count(oi.quantity) as sales_quantity, sum(p.price * oi.quantity) as sales
FROM products p
left outer join order_items oi on p.id = oi.product_id
group by p.name;

-- 매출 상위 상품 조회
SELECT p.name, sum(p.price * oi.quantity) as total_sales
FROM products p
inner join order_items oi on p.id = oi.product_id
GROUP BY p.name
order by sum(p.price * oi.quantity) desc;

-- 주문 이력이 없는 고객 조회
select c.name, o.customer_id as order_records
FROM customers c
left outer join orders o on  c.id = o.customer_id
where o.id is null;

--날짜별 매출 조회
select o.order_date, sum(p.price * oi.quantity) as sales_by_date
FROM orders o
inner join order_items oi on o.id = oi.order_id
inner join products p on oi.product_id = p.id
GROUP BY o.order_date
order by o.order_date;

--트랜잭션을 이용한 주문 처리
start transaction;
insert into orders(
    -- id,
    -- customer_id,
    -- order_date
)

insert into order_items(
    -- id,
    -- order_id,
    -- product_id,
    -- quantity
)

commit;
rollback;

