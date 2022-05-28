-- https://leetcode.com/problems/group-employees-of-the-same-salary/

create table employee_2 (employee_id int, name varchar(10), salary int)

select *,
        dense_rank() over(order by salary)  as id
from employee_2
where salary in (select salary from employee_2 group by 1 having count(salary) > 1)
order by employee_id

