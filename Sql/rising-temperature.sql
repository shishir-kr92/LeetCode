-- https://leetcode.com/problems/rising-temperature/

create table Weather (id int, recordDate Date, temperature int);

-- Solution 1
select tmp.id as id
from (
        select *,
                lag(temperature) over(order by recordDate) as prev_temperature,
                lag(recordDate) over(order by recordDate) as prev_date
        from Weather) tmp
where tmp.temperature is not null
and datediff(tmp.recordDate, tmp.prev_date) = 1
and tmp.temperature > tmp.prev_temperature

-- Solution 2
select *
from Weather as w1, Weather as w2
where datediff(w1.recordDate, w2.recordDate) = 1 and w1.temperature > w2.temperature


