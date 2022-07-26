-- https://leetcode.com/problems/leetflex-banned-accounts/

create table LogInfo (account_id int, ip_address int, login datetime, logout datetime);

select * from LogInfo

-- Solution
--with cte as (select * from LogInfo order by account_id, login desc, logout desc )

select distinct l1.account_id
from LogInfo l1
inner join LogInfo l2
on l1.account_id = l2.account_id
    and l1.ip_address != l2.ip_address
    and l1.login >= l2.login and l1.login <= l2.logout