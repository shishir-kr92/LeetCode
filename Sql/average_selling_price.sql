-- https://leetcode.com/problems/average-selling-price/

create table Prices( product_id int , start_date date, end_date  date, price int)

create table UnitsSold (product_id int, purchase_date date, units int)

select * from UnitsSold

with cte as (
    select p.product_id, p.price, u.units
    from Prices p
    inner join  UnitsSold u
    on  p.product_id = u.product_id
    and ( u.purchase_date >= p.start_date and u.purchase_date <= p.end_date)
)

select product_id, price,
    sum(price) over(partition by product_id )
from cte
