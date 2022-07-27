--https://leetcode.com/problems/biggest-single-number/


create table MyNumbers (num int)


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