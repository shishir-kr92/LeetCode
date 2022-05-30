-- https://leetcode.com/problems/immediate-food-delivery-ii/

drop table Delivery
create table Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date )

with cte as (select *,
       case when order_date = customer_pref_delivery_date then 'immediate' else 'scheduled' end as order_type,
       dense_rank() over(partition by customer_id order by order_date ) as rnk
from Delivery)

select sum(case when order_type = 'immediate' then 1 else 0 end)/count(order_type) *100 as immediate_percentage
from cte
where rnk = 1
group by rnk


select cast(100 as Decimal(5,2)), format(1, 'N2')