-- https://leetcode.com/problems/rank-scores/submissions/

create table Scores (id int, score decimal)

-- Solution
select score, dense_rank() over(order by score desc) as "rank" from Scores