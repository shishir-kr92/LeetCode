-- https://leetcode.com/problems/customers-who-bought-all-products/

create table  Customer (customer_id int, product_key int)

-- Solution
with cte as (select distinct customer_id, product_key from  Customer)

select c.customer_id
from cte
group by 1
having count(c.product_key) = (select count(*) from Product)