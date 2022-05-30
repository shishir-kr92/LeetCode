--https://leetcode.com/problems/users-with-two-purchases-within-seven-days/submissions/

--drop table Purchases
create table Purchases (purchase_id int, user_id int, purchase_date date)

-- Solution 1
with cte as (select distinct p1.*
from Purchases p1
inner join Purchases p2
    on p1.user_id = p2.user_id and p1.purchase_id != p2.purchase_id and
       p1.purchase_date >=  p2.purchase_date and
       datediff(p1.purchase_date, p2.purchase_date) <= 7)

select distinct user_id
from cte

-- Solution 2
with cte as (select *, lead(purchase_date) over(partition by user_id order by purchase_date desc) as next_date
from Purchases)

select distinct user_id
from cte
where next_date is not null and datediff(purchase_date, next_date) <= 7