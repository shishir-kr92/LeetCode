-- https://leetcode.com/problems/find-the-missing-ids/
create table Customers (customer_id int, customer_name varchar(10))

with recursive t as (
    select 1 as r_id
    UNION
    select r_id+1 from t
    WHERE r_id<(select max(customer_id) from Customers)
)

select r_id as ids
from t
where r_id not in (select distinct(customer_id) from  Customers)

