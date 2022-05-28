-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/submissions/

create table RequestAccepted (requester_id int, accepter_id int, accept_date date)

with cte as (select  r1.requester_id, r1.accepter_id
from RequestAccepted r1
union all
select r2.accepter_id, r2.requester_id
from RequestAccepted r2)

select requester_id, count(*) as num
from cte
group by 1
order by num desc limit 1
