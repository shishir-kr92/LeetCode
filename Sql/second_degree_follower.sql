-- https://leetcode.com/problems/second-degree-follower/

create table Follow(followee varchar(10), follower varchar(10))

# Write your MySQL query statement below
with cte as (select followee as follower, count(follower) as num
from Follow group by 1)

select distinct cte.*
from cte
left join Follow f
on cte.follower = f.follower and cte.num >= 1
where f.followee is not null
order by cte.follower