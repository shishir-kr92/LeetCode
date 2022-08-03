-- https://leetcode.com/problems/customers-who-never-order/

create table Customers(id int, name varchar(10));
create table Orders(id int, customerId int);


-- Solution
select name as Customers
from `Customers` c
left join `Orders` o on c.id = o.customerId
where o.id is null
order by 1


select * from Customers
select * from Orders

-- Customers.id, Orders.id as tmp

Select *
from Orders
right join Customers
On Customers.customer_id = Orders.customerId
--Where id is not Null

