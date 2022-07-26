-- https://leetcode.com/problems/department-highest-salary/
-- https://leetcode.com/problems/department-top-three-salaries/submissions/


create table Employee (id int, name varchar(10), salary int, departmentId int);
create table Department (id int, name varchar(10));

with cte as (
    select *, dense_rank() over(partition by departmentId order by salary desc) as rnk
    from Employee
)

select d.name as Department , e.name as Employee, e.salary as Salary
from cte e
inner join Department d on e.departmentId = d.id
where e.rnk = 1