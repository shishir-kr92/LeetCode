-- https://leetcode.com/problems/game-play-analysis-i/

create Table Activity (player_id int, device_id int, event_date date, games_played int);

-- Solution 1
select player_id,
       min(event_date) as first_login
from Activity
group by player_id


-- Solution 2
select tmp.player_id, tmp.event_date as first_login from(
    select player_id,
           event_date,
           row_number() over(partition by player_id order by event_date asc) as row_num
    from Activity) tmp
where tmp.row_num = 1