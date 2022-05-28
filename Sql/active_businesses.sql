-- https://leetcode.com/problems/active-businesses/

create table Events (business_id int, event_type varchar(10), occurences int)



with cte as (select event_type, avg(occurences) as avg_activity from Events group by event_type)

select e.business_id
from Events as e
join cte on e.event_type = cte.event_type
group by e.business_id
having sum(case when e.occurences > cte.avg_activity then 1 else 0 end)  > 1

