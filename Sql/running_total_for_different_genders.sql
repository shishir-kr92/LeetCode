-- https://leetcode.com/problems/running-total-for-different-genders/description/
-- CREATE

DROP TABLE  Scores
Create table If Not Exists Scores (player_name varchar(20), gender varchar(1), day date, score_points int)

insert into Scores values ('Aron', 'F', '2020-01-01', '17'),
('Alice', 'F', '2020-01-07', '23'), ('Bajrang', 'M', '2020-01-07', '7'), ('Khali', 'M', '2019-12-25', '11'),
('Slaman', 'M', '2019-12-30', '13'), ('Joe', 'M', '2019-12-31', '3'), ('Jose', 'M', '2019-12-18', '2'),
('Priya', 'F', '2019-12-31', '23'), ('Priyanka', 'F', '2019-12-30', '17')


SELECT gender, day, sum(score_points) over(partition by gender order by day asc) as total  FROM Scores