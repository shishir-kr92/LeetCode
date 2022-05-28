-- https://leetcode.com/problems/game-play-analysis-v/

create Table Activity (player_id int, device_id int, event_date date, games_played int);
truncate table Activity

select *  from Activity


select event_date

select distinct  a1.player_id as player_id , a1.event_date as e1, a2.event_date as e2
from Activity a1
inner join (select player_id, min(event_date) as event_date  from Activity group  by 1) a2
on a1.player_id = a2.player_id and datediff(a1.event_date, a2.event_date) = 1