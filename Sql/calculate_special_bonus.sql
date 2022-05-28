create table employee_4 (employee_id int, name varchar(15), salary int)

select employee_id,
    case when employee_id % 2 != 0  and name not like "M%" then salary else 0 end as bonus
from employee_4