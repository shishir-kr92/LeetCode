-- https://leetcode.com/problems/accepted-candidates-from-the-interviews/

create table Candidates (candidate_id int, name varchar(10), years_of_exp int, interview_id int)
create table Rounds (interview_id int, round_id int, score int)

select candidate_id
from Candidates c
inner join Rounds r on c.interview_id  = r.interview_id and c.years_of_exp >= 2
group by c.candidate_id
having sum(r.score) > 15

