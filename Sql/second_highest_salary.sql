--https://leetcode.com/problems/second-highest-salary/

with cte as (select *,
                dense_rank() over( order by salary ) as rnk
             from Employee)

select if(max(rnk) <2, null, salary) as SecondHighestSalary from cte where rnk = 1