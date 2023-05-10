-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/

-- Create
Create table If Not Exists Queue (person_id int, person_name varchar(30), weight int, turn int);

-- Insert
insert into Queue (person_id, person_name, weight, turn) values ('5', 'Alice', '250', '1'),
('4', 'Bob', '175', '5'),
('3', 'Alex', '350', '2'),
('6', 'John Cena', '400', '3'),
('1', 'Winston', '500', '6'),
('2', 'Marie', '200', '4');


-- Solution
with cte as (select person_name,
       turn,
       weight,
       1000 - sum(weight) over(order by turn) as remaining_weight
from Queue)

select person_name from cte
where remaining_weight >=0
order by remaining_weight asc
limit 1


