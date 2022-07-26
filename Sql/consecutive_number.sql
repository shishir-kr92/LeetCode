-- https://leetcode.com/problems/consecutive-numbers/solution/
create table Logs (id int, num int)


-- Solution 1(getting error "NOT SURE WHY :'(" )
select *
from( select *, lag() over(order by id) as "lag",
        lead() over(order by id) as "lead" from Logs) tmp
where tmp.num = tmp.lead and tmp.num = tmp.lag


--  Solution 2
with cte as (SELECT distinct l1.*, l1.num as num1, l2.num as num2
FROM Logs l1
inner join Logs l2 on l1.id + 1 =  l2.id and l1.num = l2.num
inner join Logs l3 on  l2.id + 1 =  l3.id and l1.num = l3.num)

select distinct num as ConsecutiveNums  from cte