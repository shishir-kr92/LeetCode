-- https://leetcode.com/problems/all-the-pairs-with-the-maximum-number-of-common-followers/
create table Relations (user_id int, follower_id int)

with cte as (select distinct r1.user_id as user1_id, r2.user_id as user2_id, count(*) as cnt
from Relations r1, Relations r2
where r1.follower_id = r2.follower_id and r1.user_id != r2.user_id
group by r1.user_id, r2.user_id)

select user1_id, user2_id
from cte
where user1_id < user2_id and cnt = (select max(cnt) from cte)