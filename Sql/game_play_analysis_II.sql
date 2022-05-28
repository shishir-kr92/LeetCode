-- https://leetcode.com/problems/game-play-analysis-ii/

create Table Activity (player_id int, device_id int, event_date date, games_played int);

select tmp.player_id, tmp.device_id as device_id from(
    select player_id,
           device_id,
           row_number() over(partition by player_id order by event_date asc) as row_num
    from Activity) tmp
where tmp.row_num = 1