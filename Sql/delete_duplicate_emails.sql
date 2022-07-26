--https://leetcode.com/problems/delete-duplicate-emails/

create table Person (id int, email varchar(20))

-- Solution 1
delete from Person where id not in (select min(id) from Person group by email)

-- Solution 2
select *
from (
select *, dense_rank() over(partition by email order by id ) as rnk
from Person
) tmp
where tmp.rnk = 1

