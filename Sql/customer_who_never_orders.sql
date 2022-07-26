-- https://leetcode.com/problems/customers-who-never-order/

create table Customers(id int, name varchar(10));
create table Orders(id int, customerId int);


-- Solution
select name as Customers
from `Customers` c
left join `Orders` o on c.id = o.customerId
where o.id is null
order by 1