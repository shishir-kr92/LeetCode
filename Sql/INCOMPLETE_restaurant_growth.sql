-- https://leetcode.com/problems/restaurant-growth/
create table Customer (customer_id int, name varchar(10), visited_on date, amount int)

-- Solution

with cte as (select *,
    rank() Over(order by visited_on ) as num_days,
    sum(amount) Over(order by to_char(visited_on, 'YYYY-MM-DD') range between 6 PRECEDING and CURRENT ROW) as 7_days_sum
from Customer)

select * from cte -- where num_days >= 7


with cte as (select *,
    sum(amount) Over(order by visited_on asc range between 6 PRECEDING and CURRENT ROW) as 7_days_sum
from Customer)

select * from cte -- where num_days >= 7


select *, cast(visited_on as str) from Customer

