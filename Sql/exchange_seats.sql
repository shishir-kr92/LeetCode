-- https://leetcode.com/problems/exchange-seats/

create table Seat (id int, name varchar(20))

-- Solution
# Write your MySQL query statement below
with cte as (select *, case
        when id % 2 = 0 then lag(id) over(order by id)
        else lead(id) over(order by id) end as new_id
from Seat)

select coalesce(new_id, id) as id, student from cte order by id