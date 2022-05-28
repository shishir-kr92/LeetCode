# https://leetcode.com/problems/median-employee-salary/

create table Employee (id int, company varchar(10), salary int)


--    row_number() over(partition by company order by salary asc),
--    sum(salary) over(partition by company order by salary ROWS UNBOUNDED PRECEDING ),

with cte as (select *,
    count(id) over(partition by company ) as cnt,
    row_number() over(partition by company order by salary) as rnum
from Employee)

select id, company,salary from cte
where ((cte.cnt % 2 = 0) and rnum in (cnt/2, cnt/2 +1)) or
       ((cte.cnt % 2 != 0) and (rnum = round(cnt/2)))
order by company


select *
from (
    select *,
        # Use order by id as a disambigutor to make sure the result-set is consistent both backward and forward
        row_number() over(partition by company order by salary asc, id asc) as asc_rnk,
        row_number() over(partition by company order by salary desc, id desc) as desc_rnk
    from Employee
) t
where asc_rnk between desc_rnk - 1 and desc_rnk + 1
order by id, company
