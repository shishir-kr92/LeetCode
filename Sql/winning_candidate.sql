-- https://leetcode.com/problems/winning-candidate/

create table Candidate (id  int, name varchar(20))
create table Vote (id int, candidateId int)

-- Solution 1
with cte as (select candidateId, count(candidateId)  as voteCount from vote group by 1)

select c.name
from Candidate c
left join cte on  c.id = cte.candidateId
order by cte.voteCount desc
limit 1


-- Solution 2
with cte as (select candidateId  as voteCount from vote group by 1 order by count(*) desc limit 1)

select c.name
from Candidate c
where  c.id = ( select * from cte)
