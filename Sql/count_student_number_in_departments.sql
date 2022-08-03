-- https://leetcode.com/problems/count-student-number-in-departments/

create table Student (student_id int, student_name varhcar(20), gender varchar(5), dept_id int)
create table Department ( dept_id int,  dept_name varchar(5))

-- Solution

with cte as (select dept_id , count(dept_id) as student_number from Student group by 1)

select d.dept_name, coalesce(student_number, 0)
from cte
right join Department as d
on cte.dept_id = d.dept_id
order by student_number desc, d.dept_name