-- https://leetcode.com/problems/the-most-recent-three-orders/

create table Customers (customer_id int, name varchar(10))
create table Orders (order_id int, order_date date, customer_id int, cost int)

with cte as (select o.*, c.name, dense_rank() over(partition by c.customer_id order by order_date desc ) as rnk
from Customers c
inner join Orders o on c.customer_id = o.customer_id)

select name as customer_name,
       customer_id,
       order_id,
       order_date
from cte
where rnk <= 3
order by name, customer_id, order_date desc

