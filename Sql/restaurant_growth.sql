-- https://leetcode.com/problems/restaurant-growth/description/
-- CREATE
Create table If Not Exists Customer (customer_id int, name varchar(20), visited_on date, amount int)

insert into Customer values ('1', 'Jhon', '2019-01-01', '100'), ('2', 'Daniel', '2019-01-02', '110'),
('3', 'Jade', '2019-01-03', '120'), ('4', 'Khaled', '2019-01-04', '130'),('5', 'Winston', '2019-01-05', '110'),
('6', 'Elvis', '2019-01-06', '140'), ('7', 'Anna', '2019-01-07', '150'),('8', 'Maria', '2019-01-08', '80'),
('9', 'Jaze', '2019-01-09', '110'), ('1', 'Jhon', '2019-01-10', '130'), ('3', 'Jade', '2019-01-10', '150');

with cte as (select distinct visited_on,
        sum(amount) over(order by visited_on range between interval unbounded PRECEDING ) as amount,
        count(amount) over(order by visited_on range between interval unbounded  PRECEDING ) as cnt
from `Customer`)

select visited_on, amount, cast(amount/7 as decimal(18,2))  as average_amount from cte where cnt >= 7


--