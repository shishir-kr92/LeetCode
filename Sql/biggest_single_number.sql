-- https://leetcode.com/problems/biggest-single-number/


create table MyNumbers (num int)

select * from MyNumbers

-- Solution 1
select num
from MyNumbers
group by num
having count(num) = 1
order by num desc
limit 1


-- Solution 2

with cte as (select num
from MyNumbers
group by num
having count(num) = 1)

select max(num) as num from cte


-- Solution 3
with t1 as (select num, dense_rank() over(partition by num order by num) rnk
from MyNumbers)

select max(m.num) num
from MyNumbers m
where num not in (select t1.num from t1 where t1.rnk>1)