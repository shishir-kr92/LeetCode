-- https://leetcode.com/problems/project-employees-iii/

create table Project (project_id int, employee_id int)
create table Employee(employee_id int, name varchar(10), experience_years int)


-- Solution
with cte as (Select p.project_id,
       p.employee_id,
       dense_rank() over(partition by p.project_id order by e.experience_years desc) as rnk
From Project p
inner join Employee e
on p.employee_id = e.employee_id)


select project_id, employee_id
from  cte
where rnk = 1
