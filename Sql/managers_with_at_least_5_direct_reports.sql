-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/

create table Employee_1 (id int, name varchar(10), department varchar(10), managerId int)

select * from Employee_1


select e2.name as name
from Employee_1 e1, Employee_1 e2
where e1.managerId = e2.id
group by e2.name
having count(e1.id) >= 5