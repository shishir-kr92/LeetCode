-- https://leetcode.com/problems/arrange-table-by-gender/


create table Gender (user_id int, gender varchar(10))

with cte as (select * ,
    dense_rank() over(partition by gender order by user_id) as rnk,
    case when gender = 'female' then 0 when gender = 'other' then 1 else 2 end as cntr
from Gender)

select user_id, gender
from cte
order by rnk, cntr


