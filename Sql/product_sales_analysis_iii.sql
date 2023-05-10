-- https://leetcode.com/problems/product-sales-analysis-iii/submissions/

create table Sales(sale_id int, product_id int, `year` int, quantity int,  price int)
create table Product (product_id int, product_name varchar(10))

-- Solution 1
with cte as (select product_id,
       year as first_year,
       quantity,
       price,
       dense_rank() over(partition by product_id order by year ) as rnk
from Sales)

select product_id, first_year, quantity, price
from cte where rnk = 1

-- Solution 2
with cte as ( select product_id, min(year) as year from Sales group by product_id)

select s.product_id, cte.year as first_year, s.quantity, s.price
from Sales s
inner join cte on s.product_id = cte.product_id and s.year = cte.year