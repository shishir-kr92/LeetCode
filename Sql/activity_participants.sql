-- https://leetcode.com/problems/activity-participants/

create table Friends (id int, name varchar(20), activity varchar(20));
create table Activities(id int, name varchar(20));


-- Solution
with cte as (select activity, count(*) as cnt from Friends group by 1 )

select activity
from cte
where  cnt  not in (select max(cnt) from cte)
    and cnt  not in (select min(cnt) from cte)

