-- https://leetcode.com/problems/game-play-analysis-iii/



create table toptal (id varchar(5) , name varchar(20), AnnualSalary int, ManagerId varchar(5))

select * from toptal


with manager_table as(select * from toptal where ManagerId = 'Null')
select *
 from (select *,
        dense_rank() over(partition by ManagerId order by AnnualSalary) as salary_rank
from toptal where ManagerId != 'Null') as t
join manager_table as m on t.ManagerId = m.id
where t.salary_rank = 2


select * from (
select * , dense_rank() over(partition by deptId order by AnnualSalary)  as salary_rank from (select *,
    (case when ManagerId  = 'Null' then  id else ManagerId end) as deptId
from toptal) t1)
as t2 where t2.salary_rank = 2


