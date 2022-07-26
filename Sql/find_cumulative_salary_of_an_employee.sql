-- https://leetcode.com/problems/find-cumulative-salary-of-an-employee/
create table employee_3 (id int, month int, salary int)

-- Solution1
with cte as (select e1.*,
        coalesce(e2.salary,0) as salary1, coalesce(e3.salary, 0) as salary2,
        row_number() over(partition by id order by month desc) as rnum
from employee_3 e1
left join  employee_3 e2 on (e1.id = e2.id and e1.month = e2.month + 1)
left join employee_3 e3 on ( e1.id = e3.id and e1.month = e3.month + 2))

-- Solution2
select id, month, coalesce(salary, 0) + coalesce(salary1, 0) + coalesce(salary2, 0)  as salary
from (select *,
      (case when month - lead(month,1) over(partition by id order by month desc) != 1
        then 0
       else lead(salary,1) over(partition by id order by month desc) end) as salary1,
      (case when month - lead(month,2) over(partition by id order by month desc) != 2
        then 0
      else lead(salary,2) over(partition by id order by month desc) end) as salary2,
      row_number() over(partition by id order by month desc) as rnum
from employee_3) tmp
where rnum > 1

-- Solution 3
with cte as  (select *,
    case when month - 1 =  lead(month) over(partition by id order by month desc) then lead(Salary) over(partition by id order by month desc) else 0 end as salary1,
    case when month - 2 =  lead(month, 2) over(partition by id order by month desc) then lead(Salary,2) over(partition by id order by month desc) else 0 end as salary2,
    dense_rank() over(partition by id order by month desc) as rnk
from employee_3)

select id, month , (salary + salary1 +  salary2) as salary
from cte where rnk != 1
order by id
