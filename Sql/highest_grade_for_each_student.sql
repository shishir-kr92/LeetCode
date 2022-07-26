-- https://leetcode.com/problems/highest-grade-for-each-student/
create  table Enrollments (student_id int, course_id int, grade int)

with cte as (select *,
    dense_rank() over(partition by student_id order by grade desc, course_id asc ) as rnk
from Enrollments)

select student_id, course_id, grade from cte where rnk = 1
