-- https://leetcode.com/problems/biggest-window-between-visits/submissions/
create table UserVisits (user_id int, visit_date date)

select * from UserVisits

with cte as
(select *,
        lead(visit_date,1,date('2021-01-01')) over(partition by user_id order by visit_date)  as next_date
        -- coalesce(lead(visit_date) over(partition by user_id order by visit_date),  date('2021-01-01'))  as next_date
from UserVisits u1)

select user_id, max(datediff(next_date, visit_date)) as biggest_window
from cte
group by user_id




