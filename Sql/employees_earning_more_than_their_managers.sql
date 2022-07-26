-- https://leetcode.com/problems/employees-earning-more-than-their-managers/
create table Employee_new (id int, name varchar(10), salary int, managerId int)

select * from Employee_new


-- Solution
select *
from Employee_new e1
inner join Employee_new e2 on e1.managerId = e2.id and e1.salary > e2.salary
