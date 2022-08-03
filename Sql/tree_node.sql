-- https://leetcode.com/problems/tree-node/

create table Tree(id int, p_id int)

# Write your MySQL query statement below
with cte as(
select t1.id, t1.p_id, t2.id as c_id
from `Tree` t1
left join `Tree` t2 on t1.id = t2.p_id)

select distinct id,
        case when p_id is null then 'Root'
             when c_id is null then 'Leaf'
             else 'Inner' end as 'type'
from cte