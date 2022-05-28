create table Drivers(driver_id int, join_date date)
create table Rides(ride_id int, user_id int, requested_at date)
create table AcceptedRides(ride_id int, driver_id int, ride_distance int, ride_duration int)

truncate table Drivers
truncate table Rides
truncate table AcceptedRides

select * from Drivers
select * from Rides
select * from AcceptedRides

insert into Drivers values (10, '2019-12-10');
insert into Drivers values (8, '2020-1-13');
insert into Drivers values (5, '2020-2-16');
insert into Drivers values (7, '2020-3-8');
insert into Drivers values (4, '2020-5-17');
insert into Drivers values (1, '2020-10-24');
insert into Drivers values (6, '2021-1-5');

insert into Rides values ((6, 75, '2019-12-9')
insert into Rides values (1, 54, '2020-2-9');
insert into Rides values (10, 63, '2020-3-4');
insert into Rides values (19, 39, '2020-4-6');
insert into Rides values (3, 41, '2020-6-3');
insert into Rides values (13, 52, '2020-6-22');
insert into Rides values (7, 69, '2020-7-16');
insert into Rides values (17, 70, '2020-8-25');
insert into Rides values (20, 81, '2020-11-2');
insert into Rides values (5, 57, '2020-11-9');
insert into Rides values (2, 42, '2020-12-9');
insert into Rides values (11, 68, '2021-1-11');
insert into Rides values (15, 32, '2021-1-17');
insert into Rides values (12, 11, '2021-1-19');
insert into Rides values (14, 18, '2021-1-27');


with  months as(
select 1 as mth
union select 2 as mth
union select 3 as mth
union select 4 as mth
union select 5 as mth
union select 6 as mth
union select 7 as mth
union select 8 as mth
union select 9 as mth
union select 10 as mth
union select 11 as mth
union select 12 as mth),


select distinct a.driver_id,
    case when year(join_date) < '2020' then 1 else month(join_date) end as joined_month,
    month(requested_at) as requested_month
from AcceptedRides a
inner join Rides r on a.ride_id = r.ride_id
inner join Drivers d on a.driver_id = d.driver_id
where year(requested_at) = '2020'



select distinct m.mth as month, t.joined_month, t.requested_month, driver_id
from tmp as t right join months as m on t.joined_month <= m.mth

qweryyyuiioljfhscbcbbc x c bvbbc cccccf     s1x




















